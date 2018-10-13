import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../dist/css/App.css'; /* Por ahora no definimos nuestro propio CSS. */

import React from 'react';

export default class Main extends React.Component {
  constructor(props) {
    super(props);
    this.state = { categorias: [], buscar: '' };
    this.handleRellenar = this.handleRellenar.bind(this);
  }

  /*
  componentDidMount() {
    this.interval = setInterval(() => this.tick(), 500);
  }
  */

  handleRellenar() {
    this.setState({ categorias: ['Drama', 'Terror'] });
  }

  render() {
    return (
      <div>
        <h1>TrailFlix</h1>
        <nav>
          <ul>
            {this.props.categorias.map(cat => (
              <li>{cat}</li> /* Despues podriamos cambiar la forma en la que el rest devuelve las
                                categorias y acceder por propiedades. */
            ))}
          </ul>
        </nav>
        <button type="button" onClick={this.handleRellenar}>Rellenar categorias</button>
      </div>
    );
  }
}
