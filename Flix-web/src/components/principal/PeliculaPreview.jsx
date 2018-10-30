import React from 'react';

import API from '../../service/omdbapi';

export default class PeliculaPreview extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      imagen: '/img/placeholder.png',
      duracion: this.props.datos.duracion,
      titulo: this.props.datos.titulo,
      categorias: this.props.datos.categorias,
      clasificacion: this.props.datos.clasificacion,
      fechaEstreno: this.props.datos.fechaEstreno,
    };
  }

  render() {
    return (
      <div className="card peli-card">
        <img className="card-img-top" src={this.state.imagen} alt={`imagen de ${this.state.titulo}`} />
        <div className="card-body">
          <h5 className="card-title">{this.state.titulo}</h5>
          <h5 className="card-title">Pelicula</h5>
          <p className="card-text">
            {`Duración: ${this.state.duracion} minutos`} <br />
            {`Fecha de estreno: ${this.state.fechaEstreno}`} <br />
            {`Clasificacion: ${this.state.clasificacion}`} <br />
            {`Categorias: ${this.state.categorias}`} <br />
          </p>
          <a href="#" className="btn btn-primary">Ver detalle</a>
        </div>
      </div>);
  }

}
