import dompurify from 'dompurify';
import '@mapbox/mapbox-gl-draw/dist/mapbox-gl-draw.css';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxDraw from '@mapbox/mapbox-gl-draw/dist/mapbox-gl-draw';
import d3 from 'd3';
import React from 'react';
import PropTypes from 'prop-types';
import ReactDOM from 'react-dom';
import MapGL, { Popup } from 'react-map-gl';
import WebMercatorViewport from 'viewport-mercator-project';

import Legend from './Legend';
import LayerSelector from './LayerSelector';
import SatelliteToggle from './SatelliteToggle'
import { getColor } from '../modules/CategoricalColorNamespace';
import {
  colorScalerFactory,
  hexToRGB,
} from '../modules/colors';
import {
  DEFAULT_LONGITUDE,
  DEFAULT_LATITUDE,
  DEFAULT_ZOOM,
} from '../utils/common';
import './mapbox.css';
import sandboxedEval from '../modules/sandbox';
import _ from 'lodash'

const NOOP = () => {};


function addBgLayers(map, conf, accessToken) {
  for (const key in conf) {
    if (conf[key].type === 'raster') {
     map.addLayer({
        id: key,
        type: 'raster',
        source: {
          type: 'raster',
          tiles: ['https://api.mapbox.com/v4/' + conf[key].id +
                  '/{z}/{x}/{y}.png?access_token=' + accessToken],
          bounds: conf[key].bounds,
        },
        minzoom: 0,
       maxzoom: 22,
       paint: { 'raster-opacity': conf[key].opacity },
       layout: { visibility: conf[key].visible ? 'visible' : 'none' },
     });

    } else if (conf[key].type === 'vector') {
      const paint = {
        line: {
          'line-color': conf[key].color,
          'line-opacity': conf[key].opacity,
        },
        fill: {
          'fill-color': conf[key].color,
          'fill-opacity': conf[key].opacity,
        },
        symbol: {
          'icon-color': conf[key].color,
        },
      };

      const layout = {visibility: 'none'};
      if (conf[key]['fill-type'] === 'symbol') {
        layout['icon-image'] = conf[key].icon;
      }


      map.addLayer({
        id: key,
        type: conf[key]['fill-type'],
        source: {
          type: 'geojson',
          data: '/geo_assets/' + conf[key].path,
        },
        paint: paint[conf[key]['fill-type']],
        layout,
      });
    }
  }
}




function determineColors(values, form_data) {
  const categorical = form_data.is_categorical;
  if (categorical) {
    const stops = [];
    const stops_opacity = [];
    const distinct = [];
    for (const i in values) {
      const value = values[i];
      if (!distinct.includes(value)) {
        distinct.push(value);
        const color = getColor(value, form_data.color_scheme);
        stops.push([value, color]);
        stops_opacity.push([value, 0.9]);
      }

    }
    return {stops: stops, stops_opacity:stops_opacity}
  }    
  const scaler = colorScalerFactory(form_data.linear_color_scheme, values, accessor);
  const stops = scaler.ticks().map(x=> [x, scaler(x)]);
  const stops_opacity = [[0, 0], [stops[0][0], 0.9]];
  return {stops: stops, stops_opacity:stops_opacity};

}

function accessor(value, i, array) {
    return value;
}


class MapGLDraw extends MapGL {
  constructor(props) {
    super(props);
    this.addTooltips = this.addTooltips.bind(this);
  }
  addTooltips(layerName){
    if (this.props.slice.formData.js_tooltip) {
      const jsTooltip = sandboxedEval(this.props.slice.formData.js_tooltip);
      const updatePopup = this.props.updatePopup;
      this.getMap().on('click', layerName, function (e) {
        const coordinates = e.features[0].geometry.coordinates.slice();
        const properties = e.features[0].properties;

        // Ensure that if the map is zoomed out such that multiple
        // copies of the feature are visible, the popup appears
        // over the copy being pointed to.
        while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
          coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
        }
        updatePopup({
          coordinates,
          html: dompurify.sanitize(jsTooltip(properties)),
        });
      });
    }
  }

  // Toggles the visibiliity of a layer
  toggleLayer(layer, visibility) {
    const map = this.getMap();
    map.setLayoutProperty(layer, 'visibility',
                          visibility ? 'visible' : 'none');
  }
  getChildContext() {
    return {
      viewport: new WebMercatorViewport(this.props),
      isDragging: this.state.isDragging,
      eventManager: this._eventManager,
    };
  }

  componentDidMount() {
    this.props.onRef(this);
    super.componentDidMount();
    const map = this.getMap();
    const data = this.props.json.data.data;
    const values = this.props.json.data.values;
    const geoJSONBgLayers = this.props.geoJSONBgLayers;
    const slice = this.props.slice;
    const filters = this.props.slice.getFilters() || {};
    const addTooltips = this.addTooltips;
    const accessToken = this.props.mapboxApiAccessToken;
    const form_data = this.props.json.form_data;

    
    map.on('load', function () {
      //Adds satellite layer
      map.addSource('streets-satellite', {
        type: 'raster',
        url:'mapbox://mapbox.streets-satellite'
      })
      // Displays the data distributions
      addBgLayers(map,  geoJSONBgLayers, accessToken);
      
      map.addLayer({
        'id' : 'streets-satellite',
        'type' : 'raster',
        'source' : 'streets-satellite',
        'layout' : {
          'visibility' : 'none'
        }
      });
      // Displays the data distributions
      addBgLayers(map,  geoJSONBgLayers, accessToken);
      
      map.addLayer({
        'id': 'streets-satellite',
        'type': 'raster',
        'source': 'streets-satellite',
        'layout': {
          'visibility': 'none'
        }
      });

	const colors = determineColors(values, form_data);

	const fill_color = {
	  'property': 'value',
	  'stops': colors.stops,
	}

	const fill_opacity = {
	  'property': 'value',
	  'stops': colors.stops_opacity,
	}

	if(form_data.is_categorical){
	  fill_color.type = "categorical";
	  fill_opacity.type = "categorical";
	  fill_opacity.default = 0;
	}
	
	map.addLayer({
	  id: 'polygons',
	  type: 'fill',
	  source: {
	  type: 'geojson',
	  data,
	},
	paint: {
	  'fill-color': fill_color,
	  'fill-opacity': fill_opacity,
	}
      });
      map.addLayer({
        id: 'polygons-lines',
        type: 'line',
        source: {
          type: 'geojson',
          data,
        },
        paint: {
          'line-color': 'white',
          'line-opacity': 0.8
        }
      });

      // Displays the polygon drawing/selection controls
      this.draw = new MapboxDraw({
        displayControlsDefault: false,
        controls: {
          polygon: true,
          trash: true,
        },
      });
      addTooltips('polygons');
      map.addControl(this.draw, 'top-right');
      map.resize();

      // Draw existing polygons on a refresh
      for (const filter in filters) {
        if (filter === 'geo' && filters.geo.values !== []) {
          this.draw.add(filters.geo.values);
        }
      }

      function updateFilter(e) {
        let featureCollection = {};
        if (e.features.length > 0) {
          featureCollection = {
            type: 'FeatureCollection',
            features: e.features,
          };
        }
        slice.addFilter('geo', featureCollection,
          false, true, 'geo_within');
      }

      // Logs the polygon selection changes to console.
      map.on('draw.selectionchange', updateFilter);
      // Bug in mapbox-gl-draw doesn't fire selectionchange when deleteing
      map.on('draw.delete', function () {
        updateFilter(this.draw.getSelected());
      });
    });
  }

  componentWillUnmount() {
    this.props.onRef(null);
    const map = this.getMap();
    if (!map || !map.getStyle()) {
      return;
    }
    map.removeControl(this.draw);
  }
}

const childContextTypes = {
  viewport: PropTypes.instanceOf(WebMercatorViewport),
  isDragging: PropTypes.bool,
  eventManager: PropTypes.object,
};
MapGLDraw.propTypes = Object.assign({}, MapGL.propTypes, {
  geoJSON: PropTypes.object,
});
MapGLDraw.childContextTypes = childContextTypes;

/* getBgLayersLegend
* Prepares legend data for background layers
*/

function getBgLayersLegend(layers) {
    const legends = {};
    for (const key in layers) {
        legends[key] = {
          color: layers[key].rgba,
          enabled: false,
          hex: layers[key].color,
          type: layers[key].type,
          'fill-type': layers[key]['fill-type'],
          color_bar: layers[key].color_bar,
          legend: layers[key].legend,
          icon: layers[key].icon,
        };
    }
    return legends;
    }


/* ChoroplethMap
 * A ChoroplethMap component renders the map filter visualisation with all the
 * necessary configurations and, crucially, keeps a state for the component.
 */
class ChoroplethMap extends React.Component {

  constructor(props) {
    super(props);
    const data = this.props.json.data;
    const longitude = data.viewportLongitude || DEFAULT_LONGITUDE;
    const latitude = data.viewportLatitude || DEFAULT_LATITUDE;
    this.state = {
      viewport: {
        longitude,
        latitude,
        zoom: data.viewportZoom || DEFAULT_ZOOM,
        startDragLngLat: [longitude, latitude],
      },
      popup: null,
    };
    this.bgLayers = getBgLayersLegend(this.props.json.data.geoJSONBgLayers);
    this.onViewportChange = this.onViewportChange.bind(this);
    this.toggleLayer = this.toggleLayer.bind(this);
    this.tick = this.tick.bind(this);
    this.updatePopup = this.updatePopup.bind(this);
    
    
    const colorScale = determineColors(data.values, this.props.json.form_data);
    this.colors = {};
    for (var i in colorScale.stops){
      var x = colorScale.stops[i];
      this.colors[x[0]] = {color: hexToRGB(x[1]), enabled: true};

    }
    // this.toggleSatellite = this.toggleSatellite.bind(this);
  }

  componentWillMount() {
    const timer = setInterval(this.tick, 1000);
    this.setState(() => ({ timer }));
  }

  componentWillUnmount() {
    this.clearInterval(this.state.timer);
  }

  onViewportChange(viewport) {
    this.setState({ viewport });
  }

  tick() {
    // Limiting updating viewport controls through Redux at most 1*sec
    if (this.state.previousViewport !== this.state.viewport) {
      const setCV = this.props.setControlValue;
      const vp = this.state.viewport;
      if (setCV) {
        setCV('viewport', vp);
      }
      this.setState(() => ({ previousViewport: this.state.viewport }));
    }
  }

  // Toggles the visibiliity of a layer
  toggleLayer(layer, visibility) {
    this.child.toggleLayer(layer, visibility);
  }

  updatePopup(popup) {
    this.state.popup = popup;
    this.forceUpdate();
  }

  _renderPopup() {
    const popup = this.state.popup;
    return popup && (
      <Popup
        tipSize={5}
        anchor="top"
        longitude={popup.coordinates[0]}
        latitude={popup.coordinates[1]}
        onClose={() => this.setState({ popup: null })}
      >
        <div dangerouslySetInnerHTML={{__html: popup.html }} />
      </Popup>
  );
  }

  render() {
    return (
      <div style={{ position: 'relative' }} className="mapFilter" id="mapFilter">
        <MapGLDraw
          {...this.state.viewport}
          mapStyle={this.props.slice.formData.mapbox_style}
          width={this.props.slice.width()}
          height={this.props.slice.height()}
          json={this.props.json}
          slice={this.props.slice}
          onViewportChange={this.onViewportChange}
          mapboxApiAccessToken={this.props.json.data.mapboxApiKey}
          geoJSONBgLayers={this.props.json.data.geoJSONBgLayers}
          onRef={ref => (this.child = ref)}
          updatePopup={this.updatePopup}

        >
          {this._renderPopup()}
          <Legend
            position="br"
            categories={this.colors}
          />

        </MapGLDraw>
        <SatelliteToggle 
            toggleLayer={this.toggleLayer}
            width={this.props.slice.width()}
            height={this.props.slice.height()}
            position="br"
          />
        <LayerSelector
          position="br"
          toggleLayer={this.toggleLayer}
          layers={this.bgLayers} 
          width={this.props.slice.width()}
          height={this.props.slice.height()}
        />
        
      </div>
    );
  }
}

ChoroplethMap.propTypes = {
  json: PropTypes.object,
  slice: PropTypes.object,
  setControlValue: PropTypes.func,
};


/* choroplethMap(slice, json, setControlValue)
 *
 * This is the hook called by superset to render the visualisation.  We are
 * given data associated with the slice and the JSON returned from the backend.
 * For simplicity all this data is passed to the ChoroplethMap component.
 */
function choroplethMap(slice, json, setControlValue) {
  const div = d3.select(slice.selector);
  div.selectAll('*').remove();
  ReactDOM.render(
    <ChoroplethMap
      json={json}
      slice={slice}
      setControlValue={setControlValue || NOOP}
    />,
    div.node(),
  );
}

module.exports = choroplethMap
