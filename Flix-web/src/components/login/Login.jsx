import React from 'react';

import API from '../../service/api';

import '../../dist/css/Login.css';

export default class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = { username: '', password: '' };
  }

  cambiarUsername(evento) {
    this.setState({ username: evento.target.value });
  }

  cambiarPassword(evento) {
    this.setState({ password: evento.target.value });
  }

  autorizar() {
    const body = { username: this.state.username, password: this.state.password };
    console.log({ ...body });
    API.post('/auth', { ...body })
      .then(() => this.props.history.push('/'))
      .catch(response => this.setState({ error: response.data }));
  }

  render() {
    return (
      <div>
        <div className="row">
          <div id="login-h1" className="col-2 col-show offset-5">
            <h1>Trailflix</h1>
          </div>
        </div>
        <div className="row row-show">
          <div className="col-4 col-show offset-4 input-group mb-3">
            <div className="input-group-prepend">
              <span className="input-group-text prepend">
                <img id="user" src="img/user.jpg" alt="icono de usuario" />
              </span>
            </div>
            <input
              type="text"
              className="form-control"
              placeholder="Usuario"
              aria-label="Username"
              aria-describedby="basic-addon1"
              onChange={e => this.cambiarUsername(e)}
            />
          </div>
        </div>
        <div className="row row-show">
          <div className="col-4 col-show offset-4 input-group mb-3">
            <div className="input-group-prepend">
              <span className="input-group-text prepend"><strong>*</strong></span>
            </div>
            <input
              type="password"
              className="form-control"
              placeholder="Contraseña"
              aria-label="Password"
              aria-describedby="basic-addon1"
              onChange={e => this.cambiarPassword(e)}
            />
          </div>
        </div>
        <p>{this.state.error}</p>
        <div className="row">
          <div id="login-h1" className="col-2 col-show offset-5">
            <button onClick={() => this.autorizar()} type="button" className="btn btn-primary">Entrar</button>
          </div>
        </div>
      </div>
    );
  }
}
