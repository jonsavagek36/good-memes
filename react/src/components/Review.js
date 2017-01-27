import React, { Component } from 'react';
import Upvote from './Upvote';
import Downvote from './Downvote';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      upvotes: 0,
      downvotes: 0
    };
    this.handleUpvotes = this.handleUpvotes.bind(this);
    this.handleDownvotes = this.handleDownvotes.bind(this);
  }

  componentDidMount() {
    this.updateVotes();
  }

  updateVotes() {
    fetch(`/api/v1/memes/${this.props.meme}/reviews/${this.props.review.id}/upvotes.json`, {
      credentials: 'same-origin'
    })
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(data => {
        this.setState({ upvotes: data });
      })
      fetch(`/api/v1/memes/${this.props.meme}/reviews/${this.props.review.id}/downvotes.json`, {
        credentials: 'same-origin'
      })
        .then(response => {
          if (response.ok) {
            return response;
          }
        })
        .then(response => response.json())
        .then(data => {
            this.setState({ downvotes: data });
        })
  }

  handleUpvotes(votes) {
    this.setState({ upvotes: votes });
  }

  handleDownvotes(votes) {
    this.setState({ downvotes: votes });
  }

  render() {
    let hotRating = '';
    for (let i = 0; i < this.props.review.rating; i++) {
      hotRating += '♨️';
    }
    let user_id = this.props.review.user_id;

    return (
      <div className='review'>
        <div className='review-div'>
          <img src={this.props.avatar} className="profile_thumb" />
        </div>
        <div className='review-div'>
          Review by {this.props.users[user_id]}
        </div>
        <div className='review-div'>
          Rating: {hotRating}
        </div>
        <div className='review-div'>
          {this.props.review.body}
        </div>
        <div className='review-div'>
        <Upvote
          handleUpvote={this.handleUpvotes}
          upvotes={this.state.upvotes}
          review={this.props.review}
          meme={this.props.meme}
            />
        </div>
        <div className='review-div'>
          <Downvote
            handleDownvote={this.handleDownvotes}
            downvotes={this.state.downvotes}
            review={this.props.review}
            meme={this.props.meme}
              />
        </div>
      </div>
    );
  }
}

export default Review;
