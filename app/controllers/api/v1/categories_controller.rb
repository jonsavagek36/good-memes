
class Api::V1::CategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @categories = Category.all
    render json: @categories
  end

 #  def create
 #    data = JSON.parse(request.body.read)
 #   @category = Category.new(name: data["name"], image_url: data["image_url"])
 #   if @category.save!
 #     @categories = Category.all
 #     @categories.order(:id)
 #     render json: @categories
 #   else
 #     render json: {message: "Did not work"}, status: 404
 #   end
 # end
end
