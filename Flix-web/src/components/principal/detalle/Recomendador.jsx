import React from 'react';

export default class Recomendador extends React.Component {
  constructor(props) {
    super(props);
    this.activador = React.createRef();
  }

  componentDidMount() {
    this.activador.current.addEventListener('click', () => this.agregarListeners());
  }

  agregarListeners() {
    const botones = document.getElementsByClassName('amigos');
    for (let i = 0; i < botones.length; i++) {
      botones[i].addEventListener('click', evento => this.props.enviar(evento));
    }
  }

  renderizarAmigos() {
    return this.props.amigos.map((amigo, index) => <button key={index} className="list-group-item list-group-item-action amigos" type="button">{amigo}</button>);
  }

  render() {
    return (
      <div className="btn-group dropright">
        <button ref={this.activador} type="button" className="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          {'Recomendar '}
        </button>
        <div className="dropdown-menu recomendados">
          <button id="rec-header" type="button" className="dropdown-item" disabled>Amigos</button>
          <div className="dropdown-divider" />
          {this.props.amigos !== undefined ? this.renderizarAmigos() : <span />}
        </div>
      </div>
    );
  }
}
