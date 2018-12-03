/* eslint-disable no-plusplus */
/* eslint-disable camelcase */
/* eslint-disable spaced-comment */
import React from 'react';

import API from '../../../service/api';

import ModalRelacionado from './ModalRelacionado.jsx';
import Valoraciones from './Valoraciones.jsx';
import Recomendador from './Recomendador.jsx';

import '../../../dist/css/principal/detalle/DetallePelicula.css';

export default class DetallePelicula extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      pelicula: {
        codigo: -1,
        titulo: '<NO HAY>',
        categorias: [],
        clasificacion: 'NADA',
        fechaEstreno: '01/01/2001',
        duracion: 999,
        directores: [],
        actores: [],
        valoraciones: [],
        contRelacionado: [],
        link: 'https://www.youtube.com/watch?v=tOlh-g2dxrI',
      },
      info: {
        watched: false,
        recommendations: [],
      },
      favoritos: [],
      amigos: [],
    };
    this.username = this.props.location.state !== undefined ? this.props.location.state.username : undefined;
    this.codigo = parseInt(this.props.match.params.id, 10);
    this.fav = React.createRef();
    this.tooltip = React.createRef();
    this.visto = React.createRef();
    this.modal = React.createRef();
    this.recomendador = React.createRef();
    this.enviarRecomendacion = this.enviarRecomendacion.bind(this);
  }

  componentWillMount() {
    this.traerDatos();
    this.traerFavs();
    this.traerAmigos();
  }

  componentDidMount() {
    this.agregarListeners();
  }

  traerDatos() {
    API.get(`/${this.username}/movie/${this.codigo}`)
      .then(response => this.traerTitulos(response))
      .catch();
  }

  traerTitulos(response) {
    const contenidos = response.contenido.contRelacionado;
    const cont_tit = [];
    for (let i = 0; i < contenidos.length; i++) {
      const cont = contenidos[i];
      API.get(`/titulo/${cont}`).then(tit => cont_tit.push(tit.titulo));
    }
    this.setState({ titulos: cont_tit });
    this.cargarDatos(response);
  }

  traerFavs() {
    API.get(`/${this.username}/favs`)
      .then((response) => {
        this.cargarFavs(response);
      })
      .catch();
  }

  cargarDatos(datos) {
    this.setState({ pelicula: datos.contenido, info: datos.info });
    this.visto.current.checked = datos.info.watched;
  }

  cargarFavs(datos) {
    const nuevos = datos.map(cont => cont.codigo);
    this.setState({ favoritos: nuevos });
    this.fav.current.innerHTML = nuevos.includes(this.codigo) ? 'star' : 'star_border'; //Aca se actualiza el icono de fav
  }

  traerAmigos() {
    API.get(`/${this.username}/amigos`)
      .then(response => this.cargarAmigos(response))
      .catch();
  }

  cargarAmigos(datos) {
    this.setState({ amigos: datos });
  }

  agregarListeners() {
    this.fav.current.addEventListener('click', () => this.toggleFavorito());
    this.visto.current.addEventListener('click', () => this.toggleVisto());
    this.modal.current.escuchar();
  }

  toggleFavorito() {
    const body = { value: !this.esFavorito() };
    API.put(`/${this.username}/fav/movie/${this.codigo}`, { ...body })
      .then(() => this.alternarIconoFav())
      .catch();
  }

  esFavorito() {
    return this.state.favoritos.includes(this.codigo);
  }

  alternarIconoFav() {
    this.fav.current.innerHTML = this.fav.current.innerHTML === 'star_border' ? 'star' : 'star_border';
    this.traerFavs();
  }

  toggleVisto() {
    const body = { value: !this.estaVisto() };
    API.put(`/${this.username}/watched/movie/${this.codigo}`, { ...body })
      .then()
      .catch();
  }

  estaVisto() {
    return this.state.info.watched;
  }

  enviarRecomendacion(evento) {
    const body = { from: this.username, to: evento.target.innerHTML };
    console.log(body);
    API.post(`/recommend/movie/${this.codigo}`, { ...body })
      .then(() => alert('recomendacion enviada!'))
      .catch();
  }

  codigoVideo() {
    return this.state.pelicula.link.match(/(?<==).*/g);
  }

  probarAlgo() {
    console.log(this.state.amigos);
  }

  capitalizar(palabra) {
    const nueva = palabra.toLowerCase();
    return nueva.charAt(0).toUpperCase() + nueva.slice(1);
  }

  /**
   * Prop: devuelve un array donde los datos estan separados por comas y con la primer letra mayuscula y el resto minuscula.
   */
  renderizarProlijo(propiedad) {
    let prolijo;

    if (this.state.pelicula[propiedad].length !== 1) {
      const original = [];

      for (let i = 0; i < this.state.pelicula[propiedad].length; i++) { //Se hace una copia para no referenciar la original.
        original.push(this.capitalizar(this.state.pelicula[propiedad][i]));
      }
      prolijo = original.splice(-1, 1).map(cat => `${cat}, `); //Se quita la ultima y se separan las categorias.
      prolijo.push(original[original.length - 1]);
    } else {
      prolijo = this.capitalizar(this.state.pelicula[propiedad][0]);
    }
    return prolijo;
  }

  render() {
    return (
      <div>
        <div className="row row-show">
          <h1>{this.state.pelicula.titulo}</h1>
          <i ref={this.fav} className="material-icons boton-svg estrella">star_border</i>
        </div>
        <div className="row row-show">
          <Valoraciones puntajes={this.state.pelicula.valoraciones || []} />
        </div>
        <div className="row row-show">
          <div className="col col-show">
            <iframe title={`trailer de ${this.state.pelicula.titulo}`} width="560" height="315" src={`https://www.youtube.com/embed/${this.codigoVideo()}`} frameBorder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowFullScreen />
            <div className="row row-show">
              <div className="col-3 col-show">
                <div className="misma-linea"> <input ref={this.visto} id="visto" type="checkbox" /> <h4>Vista</h4> </div>
              </div>
              <div className="col col-show">
                <Recomendador ref={this.recomendador} amigos={this.state.amigos} enviar={this.enviarRecomendacion} /> <br />
              </div>
            </div>
            {/* <button type="button" onClick={() => this.probarAlgo()}>Probar algo</button> */}
          </div>
          <div className="col col-show">
            <h3>Clasificacion: {this.state.pelicula.clasificacion}</h3>
            <h3>Categorias: {this.renderizarProlijo('categorias')}</h3>
            <h3>Duración: {this.state.pelicula.duracion} minutos</h3>
            <h3>Fecha de estreno: {this.state.pelicula.fechaEstreno}</h3>
            <h3>Directores: {this.renderizarProlijo('directores')}</h3>
            <h3>Actores: {this.renderizarProlijo('actores')}</h3>
            <ModalRelacionado ref={this.modal} titulos={this.state.titulos} contenido={this.state.pelicula.contRelacionado} username={this.props.location.state.username} />
          </div>
        </div>
      </div>
    );
  }
}
