import React from 'react';

import '../../dist/css/Tabla.css';


export default class ContenidoPreview extends React.Component {
  constructor(props) {
    super(props);
    this.state = { imagen: '/img/placeholder.png', titulo: this.props.contenido.titulo };
  }

  render() {
    console.log('holis');
    return (
      <div className="media">
        <img src={this.state.imagen} alt={`imagen de ${this.state.titulo}`} />
      </div>
    );
  }
}
