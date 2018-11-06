import React from 'react';

import '../../dist/css/principal/NavCategorias.css';

export default class Categorias extends React.Component {
  constructor(props) {
    super(props);
    this.barra = React.createRef();
  }

  agregarListeners(handler) {
    const botones = this.barra.current.children;
    for (let i = 0; i < botones.length; i++) {
      botones[i].addEventListener('click', (evento) => {
        this.toggleBoton(evento);
        handler(evento);
      });
    }
  }

  toggleBoton(evento) {
    const botones = this.barra.current.children;
    for (let i = 0; i < botones.length; i++) {
      botones[i].classList.remove('active');
    }
    evento.target.classList.toggle('active');
  }

  render() {
    return (
      <nav ref={this.barra} className="cat-nav">
        {this.props.categorias.map((cat, index) => (
          <button className="btn btn-outline-secondary nav-item" type="button" key={index}>{cat}</button>
        ))}
      </nav>
    );
  }
}
