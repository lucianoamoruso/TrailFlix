import React from 'react';

import '../../dist/css/NavCategorias.css';

export default class Categorias extends React.Component {
  toggleBoton(evento) {
    const clases = evento.target.className;
    evento.target.className = clases.includes('active') ? clases.replace(' active', '') : `${clases} active`;
  }

  render() {
    return (
      <nav className="cat-nav">
        {this.props.categorias.map(cat => (
          <button onClick={e => this.toggleBoton(e)} className="btn btn-outline-secondary nav-item" type="button">{cat}</button>
        ))}
      </nav>
    );
  }
}

/*

     className="d-flex justify-content-end align-items-end"

    <ul>
      {this.props.categorias.map(cat => (
        <li key={cat}>{cat}</li>
      ))}
    </ul>

*/
