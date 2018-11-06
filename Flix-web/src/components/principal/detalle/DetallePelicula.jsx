import React from 'react';

import API from '../../../service/api';

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
    };
    this.username = this.props.location.state !== undefined ? this.props.location.state.username : undefined;
    this.codigo = this.props.match.params.id;
  }

  componentDidMount() {
    API.get(`/${this.username}/movie/${this.codigo}`)
      .then(response => this.cargarDatos(response))
      .catch();
  }

  cargarDatos(datos) {
    this.setState({ pelicula: datos.contenido, info: datos.info });
  }

  codigoVideo() {
    return this.state.pelicula.link.match(/(?<==).*/g);
  }

  render() {
    return (
      <div>
        <h1>{this.state.pelicula.titulo}</h1>
        <img src="img/star.svg" alt="icono de estrella" />
        <iframe title={`trailer de ${this.state.pelicula.titulo}`} width="560" height="315" src={`https://www.youtube.com/embed/${this.codigoVideo()}`} frameBorder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowFullScreen />
      </div>
    );
  }
}
