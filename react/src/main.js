import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Reviews from './components/Reviews';
import App from './components/App';

$(document).ready(function() {
  if (document.getElementById('reviewsDiv')) {
    let id = parseInt(document.getElementById('reviewsDiv').dataset.id)
    ReactDOM.render(
      <Reviews
        id={id}
          />,
      document.getElementById('reviewsDiv')
    );
  }
  if (document.getElementById('app')) {
    ReactDOM.render(
      <App />,
      document.getElementById('app');
    );
  }
});
