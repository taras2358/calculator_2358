import React from "react";
import PropTypes from "prop-types";

export default class IntegerInput extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired,
    label: PropTypes.string.isRequired,
    value: PropTypes.string.isRequired,
    onChange: PropTypes.func.isRequired,
    errors: PropTypes.array
  };
  render() {
    return (
      <div>
        <label>{this.props.label}</label>
        <br />
        <input
          type="number"
          name={this.props.name}
          value={this.props.value}
          onChange={this.props.onChange}
          step="1"
        />
        <br />
        <span className="field-error">
          {this.props.errors ? this.props.errors[0] : null}
        </span>
      </div>
    );
  }
}
