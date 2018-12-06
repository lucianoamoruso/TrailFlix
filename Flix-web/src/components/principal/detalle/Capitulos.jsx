import React from 'react';

export default class Capitulos extends React.Component {
  renderizarEnlace(titulo, link, index) {
    return <a className="list-group-item list-group-item-action" key={index} href={link}>{titulo}</a>;
  }

  renderizarContenido() {
    return this.props.contenido.map((cap, index) => this.renderizarEnlace(cap.titulo, cap.link, index));
  }

  render() {
    return (
      <React.Fragment>
        <button type="button" className="btn btn-primary" data-toggle="modal" data-target="#capitulos">
          Capitulos
        </button>

        <div className="modal fade" id="capitulos" tabIndex="-1" role="dialog" aria-labelledby="capitulos" aria-hidden="true">
          <div className="modal-dialog modal-dialog-centered" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="titulo-modal">Capitulos:</h5>
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
