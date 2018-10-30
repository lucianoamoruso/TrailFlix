import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/principal/App.css';
import '../../dist/css/principal/Home.css';

import React from 'react';

import API from '../../service/api';

import Categorias from './Categorias';
import Filtro from './Filtro';
import Tabla from './Tabla';

export default class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = { categorias: [] };
    this.buscador = React.createRef();
    this.logger = React.createRef();
    this.tabla = React.createRef();
    this.navegacion = React.createRef();
  }

  componentDidMount() {
    API.get('/categories')
      .then(response => this.cargarCategorias(response))
      .catch(this.falsificarCategorias());
  }

  cargarCategorias(data) {
    const cates = data.map(cat => this.capitalizar(cat));
    this.setState({ categorias: cates });
    this.navegacion.current.agregarListeners();
  }

  /**
   * Prop: este metodo es llamado cuando no se logran traer las categorias del backend y se
   * encarga de usar unas falsas en su lugar.
   */
  falsificarCategorias() {
    this.setState({ categorias: ['No', 'Encontré', 'Nada'] });
  }

  cambiarBusqueda(evento) {
    this.tabla.current.filtrar(evento.target.value);
  }

  cambiarCategoria(evento) {
    this.tabla.current.solicitarContenido(evento.target.innerHTML.toLowerCase());
    this.buscador.current.value = '';
  }

  /**
   * Prop: cambia a mayuscula la primer letra de la palabra y la devuelve.
   */
  capitalizar(palabra) {
    return palabra.charAt(0).toUpperCase() + palabra.slice(1);
  }

  probarAlgo() {
    alert('Nada!');
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
            <input ref={this.buscador} id="busqueda" type="text" className="form-control" placeholder="Buscar..." onChange={e => this.cambiarBusqueda(e)} />
          </div>
        </div>
        <button type="button" onClick={() => this.probarAlgo()}>Probar algo</button>
        <div className="row row-show">
          <div className="col col-show">
            <Filtro />
            <p ref={this.logger}>nada</p>
          </div>
          <div onClick={e => this.cambiarCategoria(e)} className="col col-show">
            <Categorias ref={this.navegacion} categorias={this.state.categorias} />
          </div>
        </div>
        <Tabla ref={this.tabla} />
      </div>
    );
  }
}
