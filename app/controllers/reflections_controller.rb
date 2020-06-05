class ReflectionsController < ApplicationController
  before_action :require_login

  def new
    @book = Book.find_by(id: params[:book_id])
    @reflection = @book.reflections.build
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
    @today = Reflection.today
  end

  private

  def reflection_params
    params.require(:reflection).permit(:title, :content, :reflection_book_id)
  end

end
