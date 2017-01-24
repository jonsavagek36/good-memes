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
          return <li key={meme.id}><a id="main-list-items" href={"categories/" + meme.id}><img width="100" height="100" src={meme.image_url} /></a></li>;
        })}
        <li><a href='/categories/new' id="new-cat" >Add New Category</a></li>
      </ul>
      </div>
      );
    }
}

export default App;
