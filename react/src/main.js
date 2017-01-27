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
    let users = JSON.parse(document.getElementById('reviewsDiv').dataset.users);
    let avatar = document.getElementById('reviewsDiv').dataset.avatar;
    ReactDOM.render(
      <Reviews
        id={id}
        user={user}
        users={users}
        avatar={avatar}
          />,
      document.getElementById('reviewsDiv')
    );
  }
});
