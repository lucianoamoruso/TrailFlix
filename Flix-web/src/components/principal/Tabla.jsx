import React from 'react';

import '../../dist/css/Tabla.css';

import ContenidoPreview from './ContenidoPreview';

export default class Tabla extends React.Component {
  constructor(props) {
    super(props);
    this.state = { contenidos: [] };
  }

  render() {
    return (
      <div className="preview">
        <ContenidoPreview />
      </div>
    );
  }
}
