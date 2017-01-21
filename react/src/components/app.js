import React, { Component } from 'react';
import Mainpage from './Mainpage';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      memes: []
    };
  }

  componentDidMount() {
    this.getCategories();
  }

  getCategories() {
    fetch('/api/v1/categories.json')
      .then(response => response.json())
      .then(res => {
        this.setState({ memes: res });
      })
  }

  render() {
    let theRender;
    let allTheMemes = [];
    if (this.state.memes.length > 0) {
      allTheMemes = this.state.memes;
    }

    return (
      <div>
        <Mainpage memes={allTheMemes} />
      </div>
    );
  }
}

export default App;
