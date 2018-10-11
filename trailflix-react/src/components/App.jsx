import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../dist/css/App.css';

import React from 'react';

export default class App extends React.Component {
  constructor() {
    super();
    this.state = { name: 'mundo!' };
  }

  render() {
    return (
      <h1>Hola {this.state.name}</h1>
    );
  }
}
