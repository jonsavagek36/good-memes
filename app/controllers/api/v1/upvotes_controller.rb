class Api::V1::UpvotesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:index, :create]
  before_action :authenticate_user!
  respond_to :json

  def index
    @review = Review.find(params[:review_id])
    @upvotes = @review.upvotes.count
    respond_with @upvotes, json: @upvotes
  end

  def create
    @upvote = Upvote.new
    @upvote.user_id = current_user.id
    @upvote.review_id = params[:review_id]
    @upvote.save
  end

  private

  def upvote_params
    params.require(:upvote).permit(:user_id, :review_id)
  end

end
