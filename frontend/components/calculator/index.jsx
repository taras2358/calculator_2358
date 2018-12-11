import React from "react";
import Input from "components/input/index.jsx";
// import PropTypes from "prop-types";

export default class RegistrationForm extends React.Component {
  // static propTypes = {};

  constructor(props) {
    super(props);
    this.state = {
      a: "",
      errors: {}
    };
  }

  render() {
    return (
      <Input
        label="A"
        type="text"
        name="a"
        value={this.state.a}
        onChange={this.handleChange}
        errors={this.state.errors.a}
      />
    );
  }
}
