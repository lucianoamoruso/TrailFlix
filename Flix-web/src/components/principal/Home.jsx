import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/principal/App.css';
import '../../dist/css/principal/Home.css';

import React from 'react';

import Categorias from './Categorias';
import Filtro from './Filtro';
import Tabla from './Tabla';

export default class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = { categorias: [], buscar: '' };
    this.tabla = React.createRef();
    this.handleRellenar = this.handleRellenar.bind(this);
  }

  handleRellenar() {
    this.setState({ categorias: ['Drama', 'Terror', 'Accion', 'Comedia'] });
  }

  cambiarBusqueda(evento) {
    this.setState({ buscar: evento.target.value });
  }

  cambiarCategoria(evento) {
    this.setState({ sel_cat: evento.target.innerHTML.toLowerCase() });
    this.tabla.current.solicitarContenido();
  }

  filtrar() {
    console.log();
  }

  render() {
    return (
      <div>
        <div className="row row-show">
          <div id="home-h1" className="col-2 offset-5 col-show">
            <h1>TrailFlix</h1>
          </div>
        </div>
        <div className="row row-show">
          <div className="col-2 offset-5 col-show">
            <input id="busqueda" type="text" className="form-control" placeholder="Buscar..." onChange={e => this.cambiarBusqueda(e)} />
          </div>
        </div>
        <button type="button" onClick={this.handleRellenar}>Rellenar categorias</button>
        <div className="row row-show">
          <div className="col col-show">
            <Filtro />
          </div>
          <div onClick={e => this.cambiarCategoria(e)} className="col col-show">
            <Categorias categorias={this.state.categorias} />
          </div>
        </div>
        <Tabla ref={this.tabla} categoria={this.state.sel_cat} />
      </div>
    );
  }
}
