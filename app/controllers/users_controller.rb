class UsersController < ApplicationController
  
  def new 
    @book = Book.new
  end
  
  def index
   @books = Book.all
   @book = Book.new
   @user = current_user
  end
  
end
