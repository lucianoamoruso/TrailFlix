import React from 'react';

import '../../dist/css/principal/Tabla.css';

import FilaDeCartas from './FilaDeCartas';

import API from '../../service/api';

export default class Tabla extends React.Component {
  constructor(props) {
    super(props);
    this.state = { contenidos: [], filtrados: [] };
  }

  filtrar(texto) {
    let listaActualizada = this.state.contenidos;
    listaActualizada = listaActualizada.filter(cont => cont.titulo.toLowerCase().search(texto.toLowerCase()) !== -1);
    this.setState({ filtrados: listaActualizada });
  }

  // filtrar(texto) {
  //   const nuevos = this.state.contenidos.filter(cont => cont.titulo.toUpperCase().includes(texto.toUpperCase()));
  //   this.setState({ filtrados: nuevos });
  // }

  solicitarContenido(cat) {
    API.get(`/content/${cat}`)
      .then(response => this.cargarContenidos(response))
      .catch();
  }

  cargarContenidos(data) {
    this.setState({ contenidos: data, filtrados: data });
  }

  filtrarRecomendados() {
    alert('recomendados');
  }

  filtrarFavoritos() {
    alert('favoritos');
  }

  /**
   * Prop: devuelve un array que contiene arrays de max 3 Contenidos cada uno a partir de los filtrados.
   */
  distribuirCartas() {
    const filtrados = this.state.filtrados;
    const resultado = [];

    while (filtrados.length > 2) {
      const fila = [];
      fila.push(filtrados.pop());
      fila.push(filtrados.pop());
      fila.push(filtrados.pop());
      resultado.push(fila);
    }

    resultado.push(filtrados);
    return resultado;
  }

  render() {
    const cartas_a_renderizar = this.distribuirCartas();
    return (
      <div id="tabla-contenido">
        {cartas_a_renderizar.map(fila => <FilaDeCartas cartas={fila} />)}
      </div>
    );
  }
}
