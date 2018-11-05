import React from 'react';

import '../../dist/css/principal/Filtro.css';

export default class Filtro extends React.Component {
  constructor(props) {
    super(props);
    this.state = { colapsado: true };
    this.botonRec = React.createRef();
    this.botonFav = React.createRef();
    this.mostrarFiltros = this.mostrarFiltros.bind(this);
  }

  agregarListeners(handler) {
    this.botonRec.current.addEventListener('click', () => handler('rec'));
    this.botonFav.current.addEventListener('click', () => handler('fav'));
  }

  mostrarFiltros(e) {
    if (this.state.colapsado === true) {
      e.target.style.borderBottomLeftRadius = '0px';
      e.target.style.borderBottomRightRadius = '0px';
      this.setState({ colapsado: false });
    } else {
      e.target.style.borderBottomLeftRadius = '8px';
      e.target.style.borderBottomRightRadius = '8px';
      this.setState({ colapsado: true });
    }
  }

  render() {
    return (
      <nav className="flex-column filter-nav">
        <a className="nav-link active" id="filter-header" onClick={this.mostrarFiltros} data-toggle="collapse" data-target="#collapseExample" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Filtrar:</a>
        <div className="collapse" id="collapseExample">
          <a className="nav-link" ref={this.botonRec} href="#filtrar-recomendados" role="tab" aria-controls="v-pills-profile" aria-selected="false">Recomendados</a>
          <a className="nav-link" ref={this.botonFav} href="#filtrar-favoritos" role="tab" aria-controls="v-pills-profile" aria-selected="false">Favoritos</a>
        </div>
      </nav>
    );
  }
}
