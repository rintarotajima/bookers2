class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :edit]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit]

  def index
   @books = Book.all
   @book = Book.new
   @user = current_user
   @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]= "You have updated user successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless
      @user = current_user.id
      redirect_to user_path(current_user)
    end
  
  end

end