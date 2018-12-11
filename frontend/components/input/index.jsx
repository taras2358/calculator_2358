import React from "react";
import PropTypes from "prop-types";

export default class Input extends React.Component {
  static propTypes = {
    type: PropTypes.string,
    name: PropTypes.string,
    label: PropTypes.string,
    value: PropTypes.string,
    onChange: PropTypes.func,
    errors: PropTypes.array
  };
  render() {
    return (
      <div>
        <label>{this.props.label}</label>
        <br />
        <input
          type={this.props.type}
          name={this.props.name}
          value={this.props.value}
          onChange={this.props.onChange}
        />
        <br />
        <span className="field-error">
          {this.props.errors ? this.props.errors[0] : null}
        </span>
      </div>
    );
  }
}
