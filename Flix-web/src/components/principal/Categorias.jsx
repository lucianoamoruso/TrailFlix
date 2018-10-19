import React from 'react';

import '../../dist/css/NavCategorias.css';

export default class Categorias extends React.Component {
  render() {
    return (
      <div className="d-flex justify-content-end align-items-end">
        <nav className="nav justify-content-end nav-fill">
          {this.props.categorias.map(cat => (
            <button className="btn btn-outline-secondary nav-item" type="button"> {cat} </button>
          ))}
        </nav>
      </div>
    );
  }
}

/*

    <ul>
      {this.props.categorias.map(cat => (
        <li key={cat}>{cat}</li>
      ))}
    </ul>


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
