class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe stored."
      redirect_to @recipe
    else
      flash.now[:error] = "Recipe wasn't stored."
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "Recipe updated."
      redirect_to @recipe
    else
      flash.now[:error] = "Recipe wasn't updated."
      render 'edit'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [])
    end
end
