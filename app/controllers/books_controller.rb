class BooksController < ApplicationController

  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if current_user
      @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image)
  end

end
