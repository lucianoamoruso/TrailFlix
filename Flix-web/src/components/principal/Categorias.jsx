import React from 'react';

export default class Categorias extends React.Component {
  render() {
    return (
      <ul>
        {this.props.categorias.map(cat => (
          <li key={cat}>{cat}</li>
        ))}
      </ul>
    );
  }
}
