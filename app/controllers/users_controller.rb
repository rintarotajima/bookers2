class UsersController < ApplicationController
  
  def index
   @books = Book.all
   @book = Book.new
   @user = current_user
  end
  
  def show
    @user = current_user
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])      
  end
  
end
