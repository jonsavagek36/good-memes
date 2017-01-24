import React, { Component } from 'react';
import Review from './Review';

class Reviews extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }; 
  }

  componentDidMount() {
    fetch(`/api/v1/memes/${this.props.id}/reviews.json`)
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(data => {
        this.setState({ reviews: data });
      })
  }

  render() {

      let reviews = this.state.reviews.map((review, idx) => {
        return (
          <Review
            key={idx}
            meme={this.props.id}
            review={review}
              />
        );
      });

    return (
      <ul>{reviews}</ul>
    );
  }
}

export default Reviews;
