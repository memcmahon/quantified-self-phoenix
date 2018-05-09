defmodule QuantifiedSelfPhoenix.Router do
  use QuantifiedSelfPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", QuantifiedSelfPhoenix do
    pipe_through :api
    resources "/foods", FoodController, except: [:new, :edit]
    resources "/meals", MealController, only: [:index]
  end
end
