import React from 'react';
import { Link } from 'react-router-dom';

import API from '../../service/omdbapi';

export default class SeriePreview extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      imagen: '/img/placeholder.png',
      titulo: this.props.datos.titulo,
      categorias: this.props.datos.categorias,
      clasificacion: this.props.datos.clasificacion,
      fechaEstreno: this.props.datos.capitulos[0].fechaEstreno,
      cant_caps: this.props.datos.capitulos.length,
    };
  }

  conseguirImagen() {
    API.get(``)
      .then(response => this.cargarImagen(response))
      .catch(console.log('imagen no encontrada'));
  }

  cargarImagen() {

  }

  render() {
    return (
      <div className="card serie-card">
        <img className="card-img-top" src={this.state.imagen} alt={`imagen de ${this.state.titulo}`} />
        <div className="card-body">
          <h5 className="card-title">{this.state.titulo}</h5>
          <h5 className="card-title">Serie</h5>
          <p className="card-text">
            {`Cantidad de capitulos: ${this.state.cant_caps}`} <br />
            {`Fecha de estreno: ${this.state.fechaEstreno}`} <br />
            {`Clasificacion: ${this.state.clasificacion}`} <br />
            {`Categorias: ${this.state.categorias}`} <br />
          </p>
          <Link className="btn btn-primary" to={`/serie/${this.props.datos.codigo}`}>Ver detalle</Link>
        </div>
      </div>);
  }

}
