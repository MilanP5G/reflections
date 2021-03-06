class ReflectionsController < ApplicationController
  before_action :require_login
  before_action :set_reflection, only: [:edit, :update, :show, :destroy]

  def new
    @book = Book.find(params[:book_id])
    if current_user == @book.owner_user
      @reflection = @book.reflections.build
    else
      redirect_to users_path(current_user)
    end
  end

  def create
    @reflection = Reflection.create(reflection_params)
    @reflection.reflection_user = current_user
    if @reflection.save
      redirect_to book_reflection_path(@reflection.reflection_book, @reflection)
    else
      @book = @reflection.reflection_book
      render :new
    end
  end

  def show
    if current_user == @reflection.reflection_user
      @book = @reflection.reflection_book
    else
      redirect_to book_path(@reflection.reflection_book)
    end
  end

  def edit
    if current_user == @reflection.reflection_user
      @reflection.reflection_book
    else
      redirect_to book_reflection_path(@reflection.reflection_book, @reflection)
    end
  end

  def update
      if @reflection.update_attributes(reflection_params)
       redirect_to book_reflection_path(@reflection.reflection_book, @reflection)
      else
       render :edit
      end
  end

  def destroy
   if current_user == @reflection.reflection_user
      @reflection.destroy
      redirect_to user_path(@reflection.reflection_user)
   end
 end

  private

  def set_reflection
    @reflection = Reflection.find(params[:id])
  end

  def reflection_params
    params.require(:reflection).permit(:title, :content, :reflection_book_id, :reflection_user_id)
  end

end
