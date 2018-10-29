import React from 'react';

import '../../dist/css/Tabla.css';

import API from '../../service/api';
import ContenidoPreview from './ContenidoPreview';

export default class Tabla extends React.Component {
  constructor(props) {
    super(props);
    this.state = { contenidos: [] };
  }

  solicitarContenido() {
    API.get(`/content/${this.props.categoria}`)
      .then(response => this.cargarContenidos(response))
      .catch();
  }

  cargarContenidos(data) {
    this.setState({ contenidos: data });
    console.log(this.state.contenidos);
  }

  render() {
    return (
      this.state.contenidos.map(cont => (
        <div className="preview">
          <ContenidoPreview contenido={cont} />
        </div>
      )));
  }
}
