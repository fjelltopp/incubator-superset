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
        this.props.toggleLayer('satellite', !this.state.visible)
    }
   
    render() {

        return (
            <div className='satellite-toggle'>
               <button className='satellite-toggle-button'
                  onClick={this.handleClick}>{this.state.visible ? 'Satellite: ON' : 'Satellite: OFF'}</button> 
            </div>
        )
    }
}