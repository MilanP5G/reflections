class BooksController < ApplicationController
  before_action :require_login
  before_action :set_book, only: [:edit, :update, :show, :destroy]

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
  end

  def edit
    if current_user == @book.owner_user
      @book
    else
      redirect_to book_path(@book)
    end
  end

  def update
      if @book.update_attributes(user_params)
       redirect_to book_path(@book)
      else
       render :edit
      end
  end

  def destroy
   if current_user == @book.owner_user
      @book.destroy
      redirect_to user_path(@book.owner_user)
   end
 end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :image)
  end

end
