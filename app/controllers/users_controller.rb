class UsersController < ApplicationController
  def index
    before_filter :authenticate_admin!
    @users = User.all
  end

end
