class ReflectionsController < ApplicationController

  def new
    @book = Book.find_by(params[:book_id])
    @reflection = @book.reflections.build
  end

  def create
    @reflection = Reflection.new(reflection_params)
    @reflection.reflection_user = current_user
    @reflection.save
    redirect_to reflection_path(@reflection.reflection_book)
  end

  def show
    @reflection = Reflection.find(params[:id])
    @book = @reflection.reflection_book
  end

  private

  def reflection_params
    params.require(:reflection).permit(:title, :content)
  end

end
