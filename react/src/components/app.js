import React, { Component } from 'react';
import Mainpage from './Mainpage';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      memes: this.props.data.memes,
      randMeme: this.props.data.memes[0]
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    let random_meme = this.state.memes[Math.floor(Math.random()*this.state.memes.length)];
    this.setState({ randMeme: random_meme });
  }

  render() {
    return (
      <div>
        <Mainpage
          memes={this.state.memes}
          handleClick={this.handleClick}
          randomMeme={this.state.randMeme}
            />
      </div>
      );
    }
}

export default App;
