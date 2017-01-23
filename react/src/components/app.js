import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: [],
    };
  }

  componentDidMount(){
    $.ajax({
        method: "GET",
        url: "/categories.json",
      })
      .done(data => {
        this.setState({
          categories: data
        });
      });
  }

  render() {
    return (
      <div>
      <h1>THESE MEMES ARE ON 🔥🔥🔥 </h1>
      <ul id="main-page">
        {this.state.categories.map(function(meme){
          return <li key={meme.id}><a href={"categories/" + meme.id}><img id="main-list-items" src={meme.image_url} /></a></li>;
        })}
      </ul>
      </div>
      );
    }
}

export default App;
