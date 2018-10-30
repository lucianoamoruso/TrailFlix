import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../dist/css/principal/App.css';

import React from 'react';
import { Switch, Route } from 'react-router';
import { BrowserRouter } from 'react-router-dom';

import Root from './Root.jsx';
import Home from './principal/Home';
import Login from './login/Login';

export default class App extends React.Component {
  render() {
    return (
      <BrowserRouter>
        <Root>
          <Switch>
            <Route path="/login" component={Login} />
            <Route exact path="/" component={Home} />
          </Switch>
        </Root>
      </BrowserRouter>
    );
  }
}
