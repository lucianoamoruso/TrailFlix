import React from 'react';

import API from '../../service/api';

import '../../dist/css/login/Login.css';

export default class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = { username: '', password: '' };
    this.alert = React.createRef();
    this.boton = React.createRef();
  }

  componentDidMount() {
    this.agregarListeners();
  }

  agregarListeners() {
    this.boton.current.addEventListener('click', () => this.autorizar());
    document.addEventListener('keypress', (evento) => {
      if (evento.charCode === 13) { this.autorizar(); }
    });
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
      .then(() => this.irAPrincipal())
      .catch(() => this.revelarAlerta());
  }

  irAPrincipal() {
    this.props.history.push({
      pathname: '/',
      state: { username: this.state.username },
    });
  }

  revelarAlerta() {
    this.alert.current.style.display = 'block';
  }

  render() {
    return (
      <div>
        <div className="row">
          <div id="login-h1" className="col-2 col-show offset-5">
            <h1>TrailFlix</h1>
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
        <div id="error" ref={this.alert} className="row row-show">
          <div className="col-4 col-show offset-4 input-group mb-3">
            <div className="alert alert-danger" role="alert">USUARIO INCORRECTO</div>
          </div>
        </div>
        <div className="row">
          <div id="entrar" className="col-2 col-show offset-5">
            <button ref={this.boton} type="button" className="btn btn-primary">Entrar</button>
          </div>
        </div>
      </div>
    );
  }
}
