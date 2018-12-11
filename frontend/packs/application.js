import './application.css'

import "@babel/polyfill";
import ReactOnRails from "react-on-rails";

// React components
import Calculator from "components/calculator/index.jsx";

ReactOnRails.register({
  Calculator,
});

