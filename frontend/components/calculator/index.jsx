import React from "react";
import Input from "components/input/index.jsx";
// import PropTypes from "prop-types";

export default class Calculator extends React.Component {
  // static propTypes = {};

  constructor(props) {
    super(props);
    this.state = {
      a: "",
      errors: {}
    };

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    const { name: inputName, value } = event.target;
    this.setState({ [inputName]: value });
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
