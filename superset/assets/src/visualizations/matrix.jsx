import React from 'react';
import PropTypes from 'prop-types';
import d3 from 'd3';
import ReactDOM from 'react-dom';
import {
  hexToRGB,
  rgbaToHex,
} from '../modules/colors';

const propTypes = {
  className: PropTypes.string,
  width: PropTypes.number.isRequired,
  height: PropTypes.number.isRequired,
  json: PropTypes.object,
  slice: PropTypes.object
};
const defaultProps = {
  className: '',
};

function rgba_css(rgba_array){

  return "rgba(" + rgba_array.r + "," + rgba_array.g + "," + rgba_array.b + "," + rgba_array.a +")"

}


class MatrixVis extends React.PureComponent {
  constructor(props) {
    super(props);
    this.create_cell = this.create_cell.bind(this);
    this.positive_color = rgba_css(props.json.form_data.color_positive);
    this.negative_zero = rgba_css(props.json.form_data.color_zero);
  }

  create_cell(value){
    const show_values = this.props.json.form_data.show_values;
   
    const color = value > 0 ? this.positive_color:this.negative_zero;

    return (<td style={{"background-color":color}}> {show_values ? value:""} </td>)
  }

    

  render() {
    const data = this.props.json.data;
    const first_row = data.records[Object.keys(data.records)[0]];
    const table_headings = [<th></th>].concat(Object.keys(first_row).map((x) => <th>{x}</th>))

    
    const table_data = Object.keys(data.records).map((key) => <tr key={key}><td> {key} </td>{Object.values(data.records[key]).map(this.create_cell)}</tr>);

  return (
    <div>
    <table className="table dataTable table-hover table-condensed dataframe">
    <thead>
    <tr>{table_headings} </tr>
    </thead>
    <tbody>
      {table_data}
    </tbody>
      </table>
    </div>
  )

  }
  
}

MatrixVis.propTypes = propTypes;
MatrixVis.defaultProps = defaultProps;

function matrixVis(slice, json, setControlValue){
  const div = d3.select(slice.selector);
  div.selectAll('*').remove();
  
  ReactDOM.render(
    <MatrixVis
      json={json}
      slice={slice}
      width={slice.width()}
      height={slice.height()}
    />,
    div.node(),
  );

}



export default matrixVis;
