Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace "api" do
    namespace "v1" do
      resources :recipes
      resources :ingredients
    end
  end
  # root "recipes#index"
  #All recipes route, to see all my recipes
  #Add Recipe route
  #Add Ingredient route
  #Edit Recipe route
  #Edit Ingredient route
end
