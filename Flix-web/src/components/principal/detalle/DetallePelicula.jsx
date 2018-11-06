/* eslint-disable spaced-comment */
import React from 'react';

import API from '../../../service/api';

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
    };
    this.username = this.props.location.state !== undefined ? this.props.location.state.username : undefined;
    this.codigo = parseInt(this.props.match.params.id, 10);
    this.fav = React.createRef();
  }

  componentDidMount() {
    this.traerDatos();
    this.traerFavs();
    this.agregarListeners();
  }

  traerDatos() {
    API.get(`/${this.username}/movie/${this.codigo}`)
      .then(response => this.cargarDatos(response))
      .catch();
  }

  traerFavs() {
    API.get(`/${this.username}/favs`)
      .then(response => this.cargarFavs(response))
      .catch();
  }

  cargarDatos(datos) {
    this.setState({ pelicula: datos.contenido, info: datos.info });
  }

  cargarFavs(datos) {
    const nuevos = datos.map(cont => cont.codigo);
    this.setState({ favoritos: nuevos });
    this.fav.current.innerHTML = nuevos.includes(this.codigo) ? 'star' : 'star_border'; //Aca se actualiza el icono de fav
  }

  agregarListeners() {
    this.fav.current.addEventListener('click', () => this.toggleFavorito());
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

  codigoVideo() {
    return this.state.pelicula.link.match(/(?<==).*/g);
  }

  probarAlgo() {
    console.log(this.state.favoritos);
  }

  render() {
    return (
      <div>
        <div className="row row-show">
          <h1>{this.state.pelicula.titulo}</h1>
          <i ref={this.fav} className="material-icons">star_border</i>
        </div>
        <iframe title={`trailer de ${this.state.pelicula.titulo}`} width="560" height="315" src={`https://www.youtube.com/embed/${this.codigoVideo()}`} frameBorder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowFullScreen />
        <button type="button" onClick={() => this.probarAlgo()}>Probar algo</button>
      </div>
    );
  }
}
