import React from 'react';

export default class Valoraciones extends React.Component {
  calcularPromedio() {
    const cantidad = this.props.puntajes.length;
    let suma = 0;
    for (let i = 0; i < cantidad; i++) {
      suma += this.props.puntajes[i];
    }
    return Math.ceil(suma / cantidad);
  }

  renderizarVacios() {
    const huecos = [];
    const veces = 10 - this.calcularPromedio();
    for (let i = 0; i < veces; i++) {
      huecos.push(1);
    }
    return huecos.map((cora, index) => <i key={index} ref={this.fav} className="material-icons corazon">favorite_border</i>);
  }

  renderizarCorazones() {
    const corazones = [];
    const veces = this.calcularPromedio();
    for (let i = 0; i < veces; i++) {
      corazones.push(1);
    }
    return corazones.map((cora, index) => <i key={index} ref={this.fav} className="material-icons corazon">favorite</i>);
  }

  render() {
    return (
      <div id="separador-val">
        {this.props.puntajes !== undefined ? this.renderizarCorazones() : <span />}
        {this.props.puntajes !== undefined ? this.renderizarVacios() : <span />}
      </div>
    );
  }
}
