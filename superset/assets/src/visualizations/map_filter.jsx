import '@mapbox/mapbox-gl-draw/dist/mapbox-gl-draw.css';
import MapboxDraw from '@mapbox/mapbox-gl-draw/dist/mapbox-gl-draw';
import d3 from 'd3';
import React from 'react';
import PropTypes from 'prop-types';
import ReactDOM from 'react-dom';
import MapGL from 'react-map-gl';
import Legend from './Legend';
import {
  getColorFromScheme,
  hexToRGB,
  rgbaToHex,
} from '../modules/colors';
import {
  DEFAULT_LONGITUDE,
  DEFAULT_LATITUDE,
  DEFAULT_ZOOM,
} from '../utils/common';
import './mapbox.css';

const NOOP = () => {};

/* getCategories()
 *
 * Steps through every feature in a geoJSON data set, looks at the
 * cat_color value and assigns the feature a "color" property.  It
 * also returns a dictionary mapping cat_color values to a colour.  This
 * can then be used, for instance, when rendering the legend.
 *
 * Args:
 * fd - Form data storing the user settings when creating the slice.
 * data - The data to be visualised, returned by the query.
 *
 * Returns:
 * A dictionary mapping values of the colour category to the colour
 * from the colour scheme.
 */
function getCategories(formData, queryData) {

  const c = formData.color_picker || { r: 0, g: 0, b: 0, a: 1 };
  const fixedColorRGBA = [c.r, c.g, c.b, 255 * c.a];
  const fixedColorHex = rgbaToHex(fixedColorRGBA);
  const categories = {};

  queryData.forEach((d) => {
    const featureProps = d.properties;
    if (featureProps.cat_color != null) {
      let color;
      if (!categories.hasOwnProperty(featureProps.cat_color)) {
        if (formData.dimension) {
          color = getColorFromScheme(
            featureProps.cat_color,
            formData.color_scheme,
          );
        } else {
          color = fixedColorHex;
        }
        categories[featureProps.cat_color] = {
          color: hexToRGB(color),
          hex: color,
          enabled: true,
        };
      }
    featureProps.color = categories[featureProps.cat_color].hex;
    }
  });
  return categories;
}

/* MapGLDraw
 *
 * An extension of the MapGL component that harnesses the power of
 * Mapbox visualisation tools to render the map filter.
 */
class MapGLDraw extends MapGL {

  componentDidMount() {
    console.log(this.props);
    super.componentDidMount();
    const map = this.getMap();
    const data = this.props.geoJSON;

    map.on('load', function () {

      // Displays the data distributions
      map.addLayer({
          id: 'points',
          type: 'circle',
          source: {
              type: 'geojson',
              data,
          },
          paint: {
            'circle-color': ['get', 'color'],
            'circle-stroke-width': 1,
            'circle-stroke-color': '#FFF',
          },
      });

      // Displays the polygon drawing/selection controls
      this.draw = new MapboxDraw({
        displayControlsDefault: false,
          controls: {
          polygon: true,
          trash: true,
        },
      });
      map.addControl(this.draw, 'top-right');

      // Logs the polygon selection changes to console.
      // TODO: Hook in to the dashboard filter system here.
      map.on('draw.selectionchange', function (e) {
        console.log(e.features);
      });
    });

  }

  componentWillUnmount() {
    const map = this.getMap();
    if (!map || !map.getStyle()) {
      return;
    }
    map.removeControl(this.draw);
  }

}

MapGLDraw.propTypes = Object.assign({}, MapGL.propTypes, {
  geoJSON: PropTypes.object,
});


/* mapFilter(slice, json, setControlValue)
 *
 * This is the hook called by superset to render the visualisation.  We are
 * given data associated with the slice and the JSON returned from the backend.
 */
function mapFilter(slice, json, setControlValue) {

  const longitude = json.data.viewportLongitude || DEFAULT_LONGITUDE;
  const latitude = json.data.viewportLatitude || DEFAULT_LATITUDE;
  const initialViewport = {
    longitude,
    latitude,
    zoom: json.data.viewportZoom || DEFAULT_ZOOM,
    startDragLngLat: [longitude, latitude],
    onViewportChange: (viewport) => {
      setControlValue('viewport_longitude', viewport.longitude);
      setControlValue('viewport_latitude', viewport.latitude);
      setControlValue('viewport_zoom', viewport.zoom);
    },
  };
  const colors =  getCategories(
    slice.formData,
    json.data.geoJSON.features,
  );

  const div = d3.select(slice.selector);
  div.selectAll('*').remove();

  ReactDOM.render(
    <MapGLDraw
      {...initialViewport}
      mapStyle={slice.formData.mapbox_style}
      width={slice.width()}
      height={slice.height()}
      mapboxApiAccessToken={json.data.mapboxApiKey}
      geoJSON={json.data.geoJSON}
    >
      <Legend categories={colors} position="br" />
    </MapGLDraw>,
    div.node(),
  );
}

module.exports = mapFilter;
