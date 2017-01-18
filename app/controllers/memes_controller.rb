class MemesController < ApplicationController

  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)
  end

  def edit
  end

  def destroy
  end 

  private

  def meme_params
    params.require(:meme).permit(:name, :img_url)
  end

end
