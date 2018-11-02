import React from 'react';

import ContenidoPreview from './ContenidoPreview';

export default class FilaDeCartas extends React.Component {
  render() {
    return (
      <div className="row row-show">
        {this.props.cartas.map(carta => <div className="preview col-4 col-show"><ContenidoPreview contenido={carta} /></div>)}
      </div>
    );
  }
}
