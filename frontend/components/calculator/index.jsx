import React from "react";
import Input from "components/input/integer_input.jsx";
import HttpClient from "utils/http_client";
import IntegerValidator from "utils/integer_validator";

export default class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      a: "",
      b: "",
      errors: {}
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.validInputData = this.validInputData.bind(this);
  }

  handleSubmit(operation) {
    // e.preventDefault();
    const body = { a: this.state.a, b: this.state.b, operation };
    const requestBody = JSON.stringify(body);
    const client = HttpClient;
    const request = client.post("/calculations", requestBody);

    request
      .then(() => {
        window.location.href = "/";
      })
      .catch(bodyResponse => {
        this.setState({ errors: bodyResponse.errors });
      });
  }

  handleChange(event) {
    const { name: inputName, value } = event.target;
    this.setState({ [inputName]: value });
  }

  validInputData() {
    return (
      IntegerValidator.validate(this.state.a) &&
      IntegerValidator.validate(this.state.b)
    );
  }

  render() {
    const validInput = this.validInputData();
    return (
      <div>
        <Input
          label="A"
          name="a"
          value={this.state.a}
          onChange={this.handleChange}
          errors={this.state.errors.a}
        />
        <Input
          label="B"
          name="b"
          value={this.state.b}
          onChange={this.handleChange}
          errors={this.state.errors.b}
        />
        <button
          type="submit"
          onClick={() => this.handleSubmit("+")}
          disabled={!validInput}
        >
          +
        </button>
        <button
          type="submit"
          onClick={() => this.handleSubmit("=")}
          disabled={!validInput}
        >
          -
        </button>
        <textarea rows="4" disabled />
      </div>
    );
  }
}
