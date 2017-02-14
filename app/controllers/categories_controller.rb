class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if(@category.save)
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if(@category.update(category_params))
      redirect_to @category
    else
      render 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id]).destroy

    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @messages = @category.messages
  end

  private def category_params
    params.require(:category).permit(:title, :body)
  end
end
