import React, { Component } from 'react';
import { Button } from 'react-bootstrap';
import PropTypes from 'prop-types';

import './SatelliteToggle.css';

export default class SatelliteToggle extends Component {
    render() {
        return (
            <div className='satellite-toggle'>
               <a className='satellite-toggle-button'>Satellite</a> 
            </div>
        )
    }
}