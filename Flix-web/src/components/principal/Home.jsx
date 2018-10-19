import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/App.css'; /* Por ahora no definimos nuestro propio CSS. */

import React from 'react';

import Categorias from './Categorias';

export default class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = { categorias: [], buscar: '' };
    this.handleRellenar = this.handleRellenar.bind(this);
  }

  /*
  componentDidMount() {
    this.interval = setInterval(() => this.tick(), 500);
  }
  */

  handleRellenar() {
    this.setState({ categorias: ['Drama', 'Terror', 'Accion', 'Comedia', 'a', 'as', 'papa'] });
    console.log(this.state);
  }

  render() {
    return (
      <div>
        <h1>TrailFlix</h1>
        <button type="button" onClick={this.handleRellenar}>Rellenar categorias</button>
        <Categorias categorias={this.state.categorias} />
      </div>
    );
  }
}
