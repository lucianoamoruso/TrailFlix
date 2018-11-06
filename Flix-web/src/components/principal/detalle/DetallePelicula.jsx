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
      }
    };
  }

  componentDidMount() {
    API.get(`/${this.props.usuario}/movie/${this.props.match.params.id}`)
      .then(response => this.cargarDatos(response))
      .catch();
  }

  cargarDatos(datos) {
    this.setState({ pelicula: datos.contenido, info: datos.info });
  }

  render() {
    return (
      <div>
        <h1>{this.state.pelicula.titulo}</h1>
      </div>
    );
  }
}
