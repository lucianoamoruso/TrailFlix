import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/App.css';
import '../../dist/css/Home.css';

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
    this.setState({ categorias: ['Drama', 'Terror', 'Accion', 'Comedia'] });
    console.log(this.state);
  }

  render() {
    return (
      <div>
        <div className="row row-show">
          <div className="col-2 offset-4 col-show">
            <h1>TrailFlix</h1>
          </div>
        </div>
        <button type="button" onClick={this.handleRellenar}>Rellenar categorias</button>
        <div className="row row-show">
          <div className="col-4 col-show">
            <Filtro />
          </div>
          <div className="col-8 offset-4 col-show">
            <Categorias categorias={this.state.categorias} />
          </div>
        </div>
      </div>
    );
  }
}
