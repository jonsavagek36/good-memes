import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Reviews from './components/Reviews';

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
});
