import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import Reviews from './components/Reviews';

$(document).ready(function() {
  if (document.getElementById('App')) {
    ReactDOM.render(
      <App />,
      document.getElementById('App')
    );
  }
  if (document.getElementById('reviewsDiv')) {
    let id = parseInt(document.getElementById('reviewsDiv').dataset.id);
    let user = document.getElementById('reviewsDiv').dataset.user;
    ReactDOM.render(
      <Reviews
        id={id}
        user={user}
          />,
      document.getElementById('reviewsDiv')
    );
  }
});
