/* eslint-disable camelcase */
import React from 'react';

import '../../dist/css/principal/Tabla.css';

import FilaDeCartas from './FilaDeCartas';

export default class Tabla extends React.Component {
  // inferirTipo(cont) {
  //   return cont.codigo < 1000 ? 'movie' : 'serie';
  // }

  // filtrarRecomendados() {
  //   const contents = this.state.contenidos;
  //   const recomendados = [];

  //   for (let i = 0; i < contents.length; i++) {
  //     const cont = contents[i];
  //     API.get(`/${this.props.username}/${this.inferirTipo(cont)}/${cont.codigo}`)
  //       .then((response) => {
  //         if (response.info.recommendations.length > 0) {
  //           recomendados.push(cont);
  //         }
  //       })
  //       .catch();
  //   }
  //   this.setState({ contenidos: this.interseccion(this.state.contenidos, recomendados) });
  // }

  // interseccion(array1, array2) {
  //   console.log(array1);
  //   return array1.filter(value => array2.indexOf(value) !== -1);
  // }

  componentDidUpdate(prevProps) {
    console.log(prevProps);
    console.log(this.props);
  }

  filtrarFavoritos() {
    alert('favoritos');
  }

  /**
   * Prop: devuelve un array que contiene arrays de max 3 Contenidos cada uno a partir de los filtrados.
   */
  distribuirCartas() {
    const conts = this.props.contenidos;
    const resultado = [];

    while (conts.length > 2) {
      const fila = [];
      fila.push(conts.pop());
      fila.push(conts.pop());
      fila.push(conts.pop());
      resultado.push(fila);
    }

    resultado.push(conts);
    return resultado;
  }

  render() {
    const cartas_a_renderizar = this.distribuirCartas();
    return (
      <div id="tabla-contenido">
        {cartas_a_renderizar.map((fila, index) => <FilaDeCartas key={index} cartas={fila} username={this.props.username} />)}
      </div>
    );
  }
}
