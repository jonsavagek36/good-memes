class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @memes = @category.memes
    @meme = Meme.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_strong)
    if @category.save
      flash[:notice] = "Category added successfully!"
      redirect_to categories_path
    else
      flash[:notice] = @category.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def params_strong
    params.require(:category).permit(
    :name,
    :image_url
    )
  end
end
