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
import Favoritos from './Favoritos';
import Recomendados from './Recomendados';

export default class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      categorias: [], contenidos: [], favoritos: [], recomendados: [], busqueda: '',
    };
    this.buscador = React.createRef();
    this.logger = React.createRef();
    this.tabla = React.createRef();
    this.username = this.props.location.state !== undefined ? this.props.location.state.username : undefined;
    this.navegacion = React.createRef();
    this.lupa = React.createRef();
  }

  componentDidMount() {
    API.get('/categories')
      .then(response => this.cargarCategorias(response))
      .catch(this.falsificarCategorias());
    this.traerFavs();
    this.traerRecs();
    this.lupa.current.addEventListener('click', () => this.buscar());
  }

  shouldComponentUpdate(nextProps, nextState) {
    return nextProps !== this.props || nextState.contenidos !== this.state.contenidos
     || nextState.categorias !== this.state.categorias || nextState.favoritos !== this.state.favoritos
     || nextState.recomendados !== this.state.recomendados;
  }

  traerFavs() {
    API.get(`/${this.username}/favs`)
      .then((response) => {
        this.cargarFavs(response);
      })
      .catch();
  }

  cargarFavs(datos) {
    this.setState({ favoritos: datos });
  }

  traerRecs() {
    API.get(`/${this.username}/recs`)
      .then((response) => {
        this.cargarRecs(response);
      })
      .catch();
  }

  cargarRecs(datos) {
    this.setState({ recomendados: datos });
  }

  cargarCategorias(data) {
    const cates = data.map(cat => this.capitalizar(cat));
    this.setState({ categorias: cates });
    this.navegacion.current.agregarListeners(evento => this.cambiarCategoria(evento));
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
    console.log(data);
    this.setState({ contenidos: data });
  }

  /**
   * Prop: cambia a mayuscula la primer letra de la palabra y la devuelve.
   */
  capitalizar(palabra) {
    return palabra.charAt(0).toUpperCase() + palabra.slice(1);
  }

  buscar() {
    this.navegacion.current.apagarBotones();
    const body = { text: this.state.busqueda };
    API.post('/search', { ...body })
      .then(response => this.cargarDeBusqueda(response))
      .catch();
  }

  cargarDeBusqueda(data) {
    console.log(data);
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
          <div id="sesion" className="col-2 offset-3 col-show">
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
        {/* <button type="button" onClick={() => this.probarAlgo()}>Probar algo</button> */}
        <div className="row row-show">
          <div className="col col-show">
            <Filtro />
            {/* <p ref={this.logger}>nada</p> */}
          </div>
          <div className="col col-show">
            <Categorias ref={this.navegacion} categorias={this.state.categorias} />
            <Tabla username={this.username} contenidos={this.state.contenidos} ref={this.tabla} />
          </div>
        </div>
        <div className="row row-show">
          <div className="col col-show">
            {this.username !== undefined
              ? <span> <a name="favoritos" /> <Favoritos username={this.username} contenidos={this.state.favoritos} /> </span>
              : <span /> }
          </div>
        </div>
        <div className="row row-show">
          <div className="col col-show">
            {this.username !== undefined
              ? <span> <a name="recomendados" /> <Recomendados username={this.username} contenidos={this.state.recomendados} /> </span>
              : <span /> }
          </div>
        </div>
      </div>
    );
  }
}
