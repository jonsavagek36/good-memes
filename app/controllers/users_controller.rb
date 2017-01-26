class UsersController < ApplicationController
  def index
      @users = User.all
  end

  def edit
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @memes = @user.memes
  end

  def archive_user
   if current_user.admin
     @user = User.find(params[:format])
   else
     @user = User.find(current_user.id)
   end

   @user.destroy
   if current_user.admin
     flash[:notice] = "User Deleted!"
     redirect_to users_path
   else
     flash[:notice] = "Bye! Your account has been successfully cancelled.  We hope to see you again soon."
     redirect_to root_path
   end
 end


 def destroy
   @user = User.find(params[:id])
   @user.destroy
   flash[:notice] = "User Deleted!"
   redirect_to root_path
 end
end
