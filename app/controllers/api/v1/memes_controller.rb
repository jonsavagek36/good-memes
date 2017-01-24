class Api::V1::MemesController < Api::V1::BaseController

  def show
    @meme = Meme.find(params[:id])
    @reviews = @meme.reviews
    respond_with @reviews, json: @reviews
  end

end
