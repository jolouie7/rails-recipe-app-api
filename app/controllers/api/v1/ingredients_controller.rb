module Api
  module V1
    class IngredientsController < ApplicationController
      def index
        ingredient = Ingredient.all.order("created_at DESC")
        render json: {status: "SUCCESS", message: "Loaded ingredient", data: ingredient}
      end

      def create
        ingredient = Ingredient.new(ingredient_params)

        if ingredient.save
          render json: {status: "SUCCESS", message: "saved ingredient", data: ingredient}
        else
          render json: {status: "SUCCESS", message: "not saved ingredient", data: ingredient.error}
        end
      end

      def update
        ingredient = Ingredient.find(params[:id])
        ingredient.update(ingredient_params)
        # render json: ProductSerializer.new(product).serialized_json
        render json: { data: ingredient }
      end

      def destroy
        ingredient = Ingredient.find(params[:id])
        ingredient.destroy
      end

      private

      def ingredient_params
        params.require(:ingredient).permit(:name, :quantity, :recipes_id)
      end
    end
  end
end