import React from "react";
import Input from "components/input/integer_input.jsx";
import HttpClient from "utils/http_client";
import IntegerValidator from "utils/integer_validator";
import Result from "./result.jsx";
import "./index.scss";

export default class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      a: "",
      b: "",
      result: null,
      errors: {},
      inProgress: false
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.validInputData = this.validInputData.bind(this);
    this.canBeSubmited = this.canBeSubmited.bind(this);
  }

  handleSubmit(operator) {
    // e.preventDefault();
    this.setState({ inProgress: true });
    const body = { a: this.state.a, b: this.state.b, operator };
    const requestBody = JSON.stringify(body);
    const client = HttpClient;
    const request = client.post("/calculations", requestBody);

    request
      .then(responseBody => {
        // window.location.href = "/";
        this.setState({ result: responseBody.calculation, inProgress: false });
      })
      .catch(responseBody => {
        this.setState({ errors: responseBody.errors, inProgress: false });
      });
  }

  handleChange(event) {
    const { name: inputName, value } = event.target;
    const disabled = this.validInputData();

    this.setState({ [inputName]: value, disabled });
  }

  validInputData() {
    return (
      IntegerValidator.validate(this.state.a) &&
      IntegerValidator.validate(this.state.b)
    );
  }

  canBeSubmited() {
    return this.validInputData() && !this.state.inProgress;
  }

  render() {
    const disabled = !this.canBeSubmited();
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
        <div className="actions">
          <button
            type="submit"
            onClick={() => this.handleSubmit("+")}
            disabled={disabled}
          >
            +
          </button>
          <button
            type="submit"
            onClick={() => this.handleSubmit("-")}
            disabled={disabled}
          >
            -
          </button>
          <button
            type="submit"
            onClick={() => this.handleSubmit("/")}
            disabled={disabled}
          >
            /
          </button>
          <button
            type="submit"
            onClick={() => this.handleSubmit("*")}
            disabled={disabled}
          >
            *
          </button>
        </div>
        <br />
        <div>Result</div>
        <Result value={this.state.result} />
      </div>
    );
  }
}
