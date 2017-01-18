class ReviewsController < ApplicationController
 def index
   @meme = Meme.find(params[:meme_id])
   @reviews = @meme.reviews
 end

 def new
   @meme = Meme.find(params[:meme_id])
   @review = Review.new
   @review.meme = @meme
 end

 def create
  @meme = Meme.find(params[:meme_id])
  @review = Review.new(params_strong)
  @review.meme = @meme

  if @review.save
    flash[:notice] = "Review added successfully"
    redirect_to meme_path(@meme)
  else
    flash[:notice] = @review.errors.full_messages.to_sentence
    render '/reviews/new'
  end
end

private
 def params_strong
   params.require(:review).permit(
     :rating,
     :body
   )
 end
end
