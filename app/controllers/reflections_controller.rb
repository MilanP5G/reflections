class ReflectionsController < ApplicationController
  before_action :require_login

  def new
    @book = Book.find_by(id: params[:book_id])
    if current_user == @book.owner_user
      @reflection = @book.reflections.build
    else
      redirect_to users_path(current_user)
    end
  end

  def create
    @reflection = Reflection.new(reflection_params)
    @reflection.reflection_user = current_user
    @reflection.save
    redirect_to book_reflection_path(@reflection.reflection_book, @reflection)
  end

  def show
    @reflection = Reflection.find(params[:id])
    @book = @reflection.reflection_book
  end

  private

  def reflection_params
    params.require(:reflection).permit(:title, :content, :reflection_book_id)
  end

end
