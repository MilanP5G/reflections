class ReflectionsController < ApplicationController

  def new
    @book = Book.find_by(params[:book_id])
    @reflection = @book.reflections.build
  end

  def create
    @reflection = Reflection.create(reflection_params)
    @reflection.reflection_user = current_user
    @reflection.save
    redirect_to book_path(@reflection.reflection_user)
  end

  private

  def reflection_params
    params.require(:reflection).permit(:title, :content)
  end

end
