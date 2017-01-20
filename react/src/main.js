import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/app';

fetch('https://api.imgflip.com/get_memes')
  .then(response => {
    if (response.ok) {
      return response;
    }
  })
  .then(response => response.json())
  .then(res => {
    let data = res.data;
      ReactDOM.render(
        <App data={data} />,
        document.getElementById('app')
      );
  });
