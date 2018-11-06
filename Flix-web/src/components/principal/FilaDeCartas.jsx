import React from 'react';

import ContenidoPreview from './ContenidoPreview';

export default class FilaDeCartas extends React.Component {
  render() {
    return (
      <div className="fila-cartas row row-show">
        {this.props.cartas.map((carta, index) => <div key={index} className="preview col-4 col-show"><ContenidoPreview contenido={carta} /></div>)}
      </div>
    );
  }
}
