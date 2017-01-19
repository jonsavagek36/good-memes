import React, { Component } from 'react';
import Mainpage from './Mainpage';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      memes: this.props.data.memes
    };
  }

  render() {
    return (
      <div>
        <Mainpage memes={this.state.memes} />
      </div>
      );
    }
}

export default App;
