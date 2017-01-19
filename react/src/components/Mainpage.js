import React, { Component } from 'react';

class Mainpage extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }


  render() {
    return (
      <div>
        <h1>HOTT MEMES</h1>
        <ul>
          {this.props.memes.map(function(meme){
            return <li><a href='/categories'><img src={meme.url} /></a></li>;
          })}
        </ul>
      </div>

    );
  }
}

export default Mainpage;
