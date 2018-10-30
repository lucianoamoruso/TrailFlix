import React from 'react';

import '../../dist/css/principal/Tabla.css';

import API from '../../service/api';
import ContenidoPreview from './ContenidoPreview';

export default class Tabla extends React.Component {
  constructor(props) {
    super(props);
    this.state = { contenidos: [], filtrados: [] };
  }

  filtrar(texto) {
    const nuevos = this.state.contenidos.filter(cont => cont.titulo.toUpperCase().includes(texto.toUpperCase()));
    this.setState({ filtrados: nuevos });
  }

  solicitarContenido(cat) {
    API.get(`/content/${cat}`)
      .then(response => this.cargarContenidos(response))
      .catch();
  }

  cargarContenidos(data) {
    this.setState({ contenidos: data, filtrados: data });
  }

  render() {
    return (
      this.state.filtrados.map(cont => (
        <div className="preview">
          <ContenidoPreview contenido={cont} />
        </div>
      )));
  }
}
