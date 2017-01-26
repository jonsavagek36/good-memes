class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
    if params[:search]
      @categories = Category.search(params[:search]).order("created_at DESC")
      @search_term = params[:search]
    else
      @categories = Category.all.order("created_at DESC")
    end
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

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category Deleted!"
    redirect_to root_path
  end


  private

  def params_strong
    params.require(:category).permit(
    :name,
    :image_url
    )
  end
end
