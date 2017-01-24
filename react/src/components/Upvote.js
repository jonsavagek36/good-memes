import React, { Component } from 'react';

class Upvote extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {

    let handleUpvote = () => {
      let newVotes = this.props.upvotes + 1;
      fetch(`/api/v1/memes/${this.props.meme}/reviews/${this.props.review.id}/upvotes.json`, {
        credentials: 'same-origin',
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: { review_id: this.props.review.id, user_id: 'current_user' }
      })
      .then(response => {
        if (response.ok) {
          this.props.handleUpvote(newVotes);
        }
      })
    }

    return (
      <div>
        <div onClick={handleUpvote}>
          Upvote
        </div> {this.props.upvotes}
      </div>
    );
  }
}

export default Upvote;
