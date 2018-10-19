import React from 'react';

import '../../dist/css/NavCategorias.css';

export default class Categorias extends React.Component {
  render() {
    return (
      <div>
        <ul>
          {this.props.categorias.map(cat => (
            <li key={cat}>{cat}</li>
          ))}
        </ul>
        <nav className="nav justify-content-end">
          <button className="btn btn-outline-secondary" type="button">Drama</button>
          <button className="btn btn-outline-secondary" type="button">Accion</button>
          <button className="btn btn-outline-secondary" type="button">Comedia</button>
          <button className="btn btn-outline-secondary" type="button">Terror</button>
        </nav>
      </div>
    );
  }
}

/*
----- ALTERNATIVA -----
<ul className="nav nav-pills nav-fill" role="tablist">
<li className="nav-item">
  <a className="nav-link" data-toggle="tab" href="#" role="tab" aria-selected="false">Active</a>
</li>
<li className="nav-item">
<a className="nav-link" data-toggle="tab" href="#" role="tab" aria-selected="false">Longer nav link</a>
</li>
<li className="nav-item">
<a className="nav-link" data-toggle="tab" href="#" role="tab" aria-selected="false">Link</a>
</li>
<li className="nav-item">
<a className="nav-link" data-toggle="tab" href="#" role="tab" aria-selected="false">Disabled</a>
</li>
</ul>
*/
