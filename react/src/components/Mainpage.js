import React, { Component } from 'react';

class Mainpage extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    let random_meme = this.props.memes[Math.floor(Math.random()*this.props.memes.length)]

    return (
      <div>
        <h1>HOTT MEMES</h1>
        <img src={random_meme.url} />
        <h3>{random_meme.name}</h3>
      </div>
    );
  }
}

export default Mainpage;
