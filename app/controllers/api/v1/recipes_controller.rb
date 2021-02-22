module Api
  module V1
    class RecipesController < ApplicationController
      def index
        recipes = Recipe.all.order("created_at DESC")
        render json: {status: "SUCCESS", message: "Loaded recipes", data: recipes}
      end

      def create
        recipe = Recipe.new(recipe_params)

        if recipe.save
          render json: {status: "SUCCESS", message: "saved recipe", data: recipe}
        else
          render json: {status: "SUCCESS", message: "not saved recipe", data: recipe.error}
        end
      end

      def update
        recipe = Recipe.find(params[:id])
        recipe.update(recipe_params)
        # render json: ProductSerializer.new(product).serialized_json
        render json: { data: recipe }
      end

      def destroy
        recipe = Recipe.find(params[:id])
        recipe.destroy
      end

      private

      def recipe_params
        params.require(:recipe).permit(:name, :description, :measurements, :ingredients_id)
      end
    end
  end
end