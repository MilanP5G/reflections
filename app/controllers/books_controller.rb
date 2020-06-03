class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      redirect_to new_book_path
    end
  end

  private

  def reflection_params
    params.require(:book).permit(:title, :author, :image)
  end

end
