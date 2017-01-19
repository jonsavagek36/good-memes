import React, { Component } from 'react';

class Mainpage extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }


  render() {
    console.log(this.props.memes[0]);
    return (
      <div>
        <h1>HOTT MEMES</h1>
        <ul id="main-page">
          {this.props.memes.map(function(meme){
            return <li><a href={"categories/" + meme.id}><img id="main-list-items" src={meme.url} /></a></li>;
          })}
        </ul>
    </div>
    );
  }
}

export default Mainpage;
