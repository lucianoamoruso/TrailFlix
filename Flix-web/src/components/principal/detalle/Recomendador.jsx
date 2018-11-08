import React from 'react';

export default class Recomendador extends React.Component {

  renderizarAmigos() {
    
  }

  render() {
    return (
      <div className="btn-group dropright">
        <button type="button" className="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          {'Recomendar '}
        </button>
        <div className="dropdown-menu recomendados">
          <button id="rec-header" type="button" className="dropdown-item" disabled>Amigos</button>
          <div className="dropdown-divider" />
          {this.props.amigos !== undefined ? this.renderizarAmigos() : <span />}
          <button className="list-group-item list-group-item-action" type="button">holis</button>
        </div>
      </div>

    );
  }
}
