class BooksController < ApplicationController
  before_action :require_login

  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    @book.owner_user == current_user
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if current_user == @book.owner_user
      @book
    else
      redirect_to book_path(@book)
    end
  end

  def update
    @book = Book.find(params[:id])
      if @book.update_attributes(user_params)
       redirect_to book_path(@book)
      else
       render :edit
      end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image)
  end

end
