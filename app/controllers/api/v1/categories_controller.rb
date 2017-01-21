class Api::V1::CategoriesController < Api::V1::BaseController

  def index
    respond_with Category.all
  end

  def show
    @category = Category.find(params[:id])
    @memes = @category.memes
    respond_with @category, json: @category
  end

  def create
    respond_with :api, :v1, Category.create(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:id, :name, :description)
  end

end
