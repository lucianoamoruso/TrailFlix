import React from 'react';

import '../../dist/css/Filtro.css';

export default class Filtro extends React.Component {
  render() {
    return (
      <div>
        <nav className="flex-column filter-nav">
          <button className="btn btn-primary nav-item" type="button" data-toggle="collapse" data-target="#filtros" aria-expanded="false" aria-controls="collapseExample">
            Filtrar:
          </button>
          <div className="collapse" id="filtros">
            <button className="btn btn-outline-secondary nav-item" type="button"> Recomendados </button><br />
            <button className="btn btn-outline-secondary nav-item" type="button"> Favoritos </button>
          </div>
        </nav>
        //Segunda opcion
        <nav className="flex-column filter-nav">
          <a className="nav-link active" id="filter-header" data-toggle="collapse" data-target="#collapseExample" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Filtrar:</a>
          <div className="collapse" id="collapseExample">
            <a className="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Recomendados</a>
            <a className="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Favoritos</a>
          </div>
        </nav>
      </div>

    );
  }
}
