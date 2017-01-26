class Api::V1::DownvotesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:index, :create]
  before_action :authenticate_user!
  respond_to :json

  def index
    @review = Review.find(params[:review_id])
    @downvotes = @review.downvotes.count
    respond_with @downvotes, json: @downvotes
  end

  def create
    @downvote = Downvote.new
    @downvote.user_id = current_user.id
    @downvote.review_id = params[:review_id]
    @downvote.save
    @review = Review.find(params[:review_id])
    @downvotes = @review.downvotes.count
    respond_with @downvotes, json: @downvotes
  end

  private

  def downvote_params
    params.require(:downvote).permit(:user_id, :review_id)
  end

end
