import React from 'react';

import '../../dist/css/NavCategorias.css';

export default class Categorias extends React.Component {
  render() {
    return (
      <div>
        <nav className="cat-nav">
          {this.props.categorias.map(cat => (
            <button className="btn btn-outline-secondary nav-item" type="button"> {cat} </button>
          ))}
        </nav>
      </div>
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
