import React from "react";
import PropTypes from "prop-types";

export default class Result extends React.Component {
  static propTypes = {
    value: PropTypes.object
  };

  render() {
    let formattedResult = "";

    if (this.props.value) {
      const { operation, result, id, count } = this.props.value;
      formattedResult = [
        `Operation: ${operation}`,
        `Result: ${result}`,
        `ID:${id}`,
        `Count: ${count}`
      ].join("\n");
    }

    return <textarea rows="4" disabled value={formattedResult} />;
  }
}
