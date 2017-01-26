class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    @meme = Meme.find(params[:meme_id])
    @reviews = @meme.reviews
    respond_with @reviews, json: @reviews
  end

end
