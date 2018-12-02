import React, { Component } from 'react';
import { Button } from 'react-bootstrap';
import PropTypes from 'prop-types';

import './SatelliteToggle.css';

export default class SatelliteToggle extends Component {
    constructor(props) {
        super(props);
        this.state = { visible: true };

        this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
        this.setState(state => ({
            visible: !state.visible
        }));
        this.props.toggleLayer('satellite')
        // var visibility = map.getLayoutProperty('satellite', 'visibility');
        // if (visibility === 'visible') {
        //     map.setLayoutProperty('satellite', 'visibility', 'none');
        //     this.className = 'satellite-button';
        // } else {
        //     this.className = 'satellite-button-active';
        //     map.setLayoutProperty('satellite', 'visibility', 'visible');
        // }
    }
    // basically need to set up state with active/not active (in  layerselector
    // done by checkboxes, the way i got this to work is changing className...)
    render() {
        return (
            <div className='satellite-toggle'>
               <button className='satellite-toggle-button'
                  onClick={this.handleClick}>{this.state.visible ? 'ON' : 'OFF'}</button> 
            </div>
        )
    }
}