/* eslint-disable camelcase */
import React from 'react';

import FilaDeCartas from './FilaDeCartas';

export default class Recomendados extends React.Component {
  distribuirCartas() {
    const conts = this.props.contenidos;
    const resultado = [];

    while (conts.length > 4) {
      const fila = [];
      fila.push(conts.pop());
      fila.push(conts.pop());
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
      <div>
        <h3>Recomendados</h3>
        {cartas_a_renderizar.map((fila, index) => <FilaDeCartas key={index} cartas={fila} username={this.props.username} />)}
      </div>
    );
  }
}
