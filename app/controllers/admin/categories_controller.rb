class Admin::CategoriesController < ApplicationController
  
  http_basic_authenticate_with name: ENV["JUNGLE_USERNAME"], password: ENV["JUNGLE_PASSWORD"]

  def index
    @categories = Category.order(id: :desc).all
  end

  def new 
    @categories = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categories created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
