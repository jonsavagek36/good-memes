import React, { Component } from 'react';

class Mainpage extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }


  render() {

    let memes;

    if (this.props.memes != undefined) {
      memes = this.props.memes.map(meme => {
        return (
          <li><img src={meme.image_url} />{meme.name}</li>
        );
      });
    } else {
      memes = [];
    }

    return (
      <div>
        <h1>HOTT MEMES</h1>
        <div id="main-page">
          <ul>
            {memes}
          </ul>
        </div>
    </div>
    );
  }
}

export default Mainpage;
