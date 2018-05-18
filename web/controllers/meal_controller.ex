defmodule QuantifiedSelfPhoenix.MealController do
  use QuantifiedSelfPhoenix.Web, :controller

  alias QuantifiedSelfPhoenix.Meal

  def index(conn, _params) do
    meals = Repo.all(Meal)
      |> Repo.preload(:foods)
    render(conn, "index.json", meals: meals)
  end

  def show(conn, %{"id" => id}) do
    meal = Repo.get!(Meal, id)
      |> Repo.preload(:foods)
    render(conn, "show.json", meal: meal)
  end
end
