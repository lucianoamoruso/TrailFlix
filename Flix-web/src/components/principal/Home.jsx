/* eslint-disable camelcase */
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/principal/App.css';
import '../../dist/css/principal/Home.css';

import React from 'react';
import { Link } from 'react-router-dom';

import API from '../../service/api';

import Categorias from './Categorias';
import Filtro from './Filtro';
import Tabla from './Tabla';

export default class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = { categorias: [], contenidos: [], busqueda: '' };
    this.buscador = React.createRef();
    this.logger = React.createRef();
    this.tabla = React.createRef();
    this.filtro = React.createRef();
    this.username = this.props.location.state !== undefined ? this.props.location.state.username : undefined;
    this.navegacion = React.createRef();
    this.lupa = React.createRef();
  }

  componentDidMount() {
    API.get('/categories')
      .then(response => this.cargarCategorias(response))
      .catch(this.falsificarCategorias());
    this.lupa.current.addEventListener('click', () => this.buscar());
  }

  cargarCategorias(data) {
    const cates = data.map(cat => this.capitalizar(cat));
    this.setState({ categorias: cates });
    this.navegacion.current.agregarListeners(evento => this.cambiarCategoria(evento));
    this.filtro.current.agregarListeners(evento => this.aplicarFiltro(evento));
  }

  /**
   * Prop: este metodo es llamado cuando no se logran traer las categorias del backend y se
   * encarga de usar unas falsas en su lugar.
   */
  falsificarCategorias() {
    this.setState({ categorias: ['No', 'Encontré', 'Nada'] });
  }

  cambiarBusqueda(evento) {
    this.setState({ busqueda: evento.target.value });
  }

  cambiarCategoria(evento) {
    this.buscador.current.value = '';
    this.solicitarContenido(evento.target.innerHTML.toLowerCase());
  }

  solicitarContenido(cat) {
    API.get(`/content/${cat}`)
      .then(response => this.cargarContenidos(response))
      .catch();
  }

  cargarContenidos(data) {
    this.setState({ contenidos: data });
  }

  /**
   * Prop: cambia a mayuscula la primer letra de la palabra y la devuelve.
   */
  capitalizar(palabra) {
    return palabra.charAt(0).toUpperCase() + palabra.slice(1);
  }

  aplicarFiltro(tipo) {
    if (tipo === 'rec') {
      this.tabla.current.filtrarRecomendados();
    } else {
      this.tabla.current.filtrarFavoritos();
    }
  }

  buscar() {
    this.navegacion.current.apagarBotones();
    const body = { text: this.state.busqueda };
    API.post('/search', { ...body })
      .then(response => this.cargarDeBusqueda(response))
      .catch();
  }

  cargarDeBusqueda(data) {
    this.setState({ contenidos: data });
  }

  probarAlgo() {
    console.log(this.state.contenidos);
    // alert('Nada!');
  }

  render() {
    return (
      <div>
        <div className="row row-show">
          <div id="home-h1" className="col-2 offset-5 col-show">
            <h1>TrailFlix</h1>
          </div>
          <div className="col-2 offset-3 col-show">
            {this.username !== undefined
              ? <h3>Bienvenido {this.username}</h3>
              : <Link className="btn btn-primary" to="/login">Inicie sesión</Link>}
          </div>
        </div>
        <div className="row row-show">
          <div className="col-2 offset-5 col-show inline">
            <input ref={this.buscador} id="busqueda" type="text" className="form-control" placeholder="Buscar..." onChange={e => this.cambiarBusqueda(e)} />
            <i ref={this.lupa} id="icon-buscar" className="material-icons boton-svg">search</i>
          </div>
        </div>
        <button type="button" onClick={() => this.probarAlgo()}>Probar algo</button>
        <div className="row row-show">
          <div className="col col-show">
            <Filtro ref={this.filtro} />
            <p ref={this.logger}>nada</p>
          </div>
          <div className="col col-show">
            <Categorias ref={this.navegacion} categorias={this.state.categorias} />
            <Tabla username={this.username} contenidos={this.state.contenidos} ref={this.tabla} />
          </div>
        </div>
      </div>
    );
  }
}
