class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:sucess]="You created to book successfully"
      redirect_to book_path(@book)
    else
      flash[:error]="Failed to create book"
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success]="You have updated book successfully."
      redirect_to book_path(@book)
    else
      flash[:error]="Failed to update b"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end
