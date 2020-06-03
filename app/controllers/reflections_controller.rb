class ReflectionsController < ApplicationController

  def new
    @reflection = Reflection.new
  end

  def create
    @reflection = Reflection.create(reflection_params)
    if @reflection.save
      redirect_to reflection_path(@reflection.book)
    else
      redirect_to new_reflection_path
    end
  end 




end
