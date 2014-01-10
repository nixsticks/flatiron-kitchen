class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient stored."
      redirect_to @ingredient
    else
      flash.now[:error] = "Ingredient wasn't stored."
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(ingredient_params)
      flash[:success] = "Ingredient updated."
      redirect_to @ingredient
    else
      flash.now[:error] = "Ingredient wasn't updated."
      render 'edit'
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to ingredients_path
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :recipe_ids => [])
    end
end
