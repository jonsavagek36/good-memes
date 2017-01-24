import React, { Component } from 'react';

class Downvote extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {

    let handleDownvote = () => {
      let newVote = this.props.downvotes + 1;
      fetch(`/api/v1/memes/${this.props.meme}/reviews/${this.props.review.id}/downvotes.json`, {
        credentials: 'same-origin',
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: { review_id: this.props.review.id, user_id: 'current_user' }
      })
      .then(response => {
        if (response.ok) {
          this.props.handleDownvote(newVote);
        }
      })
    }

    return (
      <div>
        <div onClick={handleDownvote}>
          Downvote
        </div> {this.props.downvotes}
      </div>
    );
  }
}

export default Downvote;
