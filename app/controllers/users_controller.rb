class UsersController < ApplicationController

  def index
   @books = Book.all
   @book = Book.new
   @user = current_user
  end

  def show
    @user = current_user
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]= "You have updated user successfully."
      redirect_to @user
    else
      flash.now[:error]="Failed to update profile"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
