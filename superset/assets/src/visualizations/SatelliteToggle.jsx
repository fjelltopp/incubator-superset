import React, { Component } from 'react';
import { Button } from 'react-bootstrap';
import PropTypes from 'prop-types';

import './SatelliteToggle.css';

export default class SatelliteToggle extends Component {
    constructor(props) {
        super(props);
        this.state = { visible: false };

        this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
        this.setState(state => ({
            visible: !state.visible
        }));
        this.props.toggleLayer('streets-satellite', !this.state.visible)
    }
   
    render() {

        return (
            <div className='satellite-toggle'
                 style={{ width: this.props.width, height: this.props.height }}
            >
               <Button className='satellite-toggle-button'
                  onClick={this.handleClick}>
                  {this.state.visible ? 
                    <i className="material-icons">satellite</i> : 
                    <i className="material-icons">map</i>}
               </Button> 
            </div>
        )
    }
}