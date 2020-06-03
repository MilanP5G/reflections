class ReflectionsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @reflection = @book.reflections.build
  end

  def create
    @reflection = Reflection.create(reflection_params)
    if @reflection.save
      redirect_to reflection_path(@reflection.book)
    else
      redirect_to new_reflection_path
    end
  end

  private

  def reflection_params
    params.require(:reflection).permit(:title, :content)
  end

end
