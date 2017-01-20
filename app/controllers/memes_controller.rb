class MemesController < ApplicationController
  before_action :authenticate_user!

  def show
    @meme = Meme.find(params[:id])
    @reviews = @meme.reviews
    @review = Review.new
    @rating_collection = Review::RATINGS
  end

  def new
    @category = Category.find(params[:category_id])
    @user = current_user.id
    @meme = Meme.new
  end

  def create
    @category = Category.find(params[:category_id])

    if user_signed_in?
      @user = current_user
      @meme = Meme.new(meme_params)
      @meme.category = @category
      @meme.user = @user

      if @meme.save
        @category.memes << @meme
        flash[:notice] = "Meme successfully added"
        redirect_to category_path(@category)
      else
        flash[:notice] = @meme.errors.full_messages.to_sentence
        @memes = @category.memes
        render '/categories/show'
      end

    else
      flash[:notice] = "You must be logged in to do that"
      redirect_to category_path(@category)
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:name, :img_url, :user_id)
  end

end
