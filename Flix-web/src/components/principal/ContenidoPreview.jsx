import React from 'react';
import PeliculaPreview from './PeliculaPreview';
import SeriePreview from './SeriePreview';

import '../../dist/css/principal/ContenidoCard.css';

export default class ContenidoPreview extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tipo: this.props.contenido.codigo < 1000 ? 'Pelicula' : 'Serie',
    };
  }

  render() {
    return (this.state.tipo === 'Pelicula' ? <PeliculaPreview datos={this.props.contenido} username={this.props.username} /> : <SeriePreview datos={this.props.contenido} username={this.props.username} />);
  }
}
