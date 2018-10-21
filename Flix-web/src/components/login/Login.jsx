import React from 'react';

import '../../dist/css/Login.css';

export default class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = { username: '', password: '' };
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
                <img id="user" src="https://image.freepik.com/free-icon/male-user-shadow_318-34042.jpg" alt="icono de usuario" />
              </span>
            </div>
            <input type="text" className="form-control" placeholder="Usuario" aria-label="Username" aria-describedby="basic-addon1" />
          </div>
        </div>
        <div className="row row-show">
          <div className="col-4 col-show offset-4 input-group mb-3">
            <div className="input-group-prepend">
              <span className="input-group-text prepend"><strong>*</strong></span>
            </div>
            <input type="password" className="form-control" placeholder="Contraseña" aria-label="Password" aria-describedby="basic-addon1" />
          </div>
        </div>
        <div className="row">
          <div id="login-h1" className="col-2 col-show offset-5">
            <button type="button" className="btn btn-primary">Entrar</button>
          </div>
        </div>
      </div>
    );
  }
}
