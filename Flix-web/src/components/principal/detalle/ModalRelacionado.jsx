/* eslint-disable no-plusplus */
/* eslint-disable camelcase */
import React from 'react';
import { Link } from 'react-router-dom';

export default class ModalRelacionado extends React.Component {
  constructor(props) {
    super(props);
    this.activador = React.createRef();
    this.enlaces = React.createRef();
  }

  escuchar() {
    const botones = this.enlaces.current.children;
    this.activador.current.addEventListener('click', () => this.rellenarEnlaces(botones));
  }

  rellenarEnlaces(botones) {
    for (let i = 0; i < botones.length; i++) {
      this.enlaces.current.children[i].addEventListener('click', () => window.location.reload());
      this.enlaces.current.children[i].innerHTML = this.props.titulos[i];
    }
  }

  evaluarTipo(contenido) {
    return contenido < 1000 ? 'pelicula' : 'serie';
  }

  renderizarEnlace(cod, titulo, index) {
    return (
      <Link
        key={index}
        className="list-group-item list-group-item-action"
        to={{ pathname: `/${this.evaluarTipo(cod)}/${cod}`, state: { username: this.props.username } }}
      > {cod}
      </Link>
    );
  }

  renderizarContenido() {
    const codigos = this.props.contenido;
    const cont_tit = this.props.titulos;
    const enlaces = [];
    for (let i = 0; i < codigos.length; i++) {
      enlaces.push(this.renderizarEnlace(
        codigos[i],
        cont_tit[i],
        i,
      ));
    }
    return enlaces;
  }

  render() {
    return (
      <React.Fragment>
        <button ref={this.activador} type="button" className="btn btn-primary" data-toggle="modal" data-target="#contenidos">
          Contenido relacionado
        </button>

        <div className="modal fade" id="contenidos" tabIndex="-1" role="dialog" aria-labelledby="contenidos" aria-hidden="true">
          <div className="modal-dialog modal-dialog-centered" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="titulo-modal">Contenido relacionado:</h5>
                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div className="modal-body">
                <div ref={this.enlaces} className="list-group">
                  {this.renderizarContenido()}
                </div>
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-secondary" data-dismiss="modal">Volver</button>
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}
