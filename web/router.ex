defmodule QuantifiedSelfPhoenix.Router do
  use QuantifiedSelfPhoenix.Web, :router

  pipeline :api do
    plug CORSPlug, origins: ["*"]
    plug :accepts, ["json"]
  end

  scope "/api/v1", QuantifiedSelfPhoenix do
    pipe_through :api
    resources "/foods", FoodController, except: [:new, :edit]
    resources "/meals", MealController, only: [:index]
    get "/meals/:id/foods", MealController, :show
    post "/meals/:meal_id/foods/:id", MealFoodController, :create
    delete "/meals/:meal_id/foods/:id", MealFoodController, :delete
  end
end
