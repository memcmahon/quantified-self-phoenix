defmodule QuantifiedSelfPhoenix.MealView do
  use QuantifiedSelfPhoenix.Web, :view

  def render("index.json", %{meals: meals}) do
    render_many(meals, QuantifiedSelfPhoenix.MealView, "meal.json")
  end

  def render("show.json", %{meal: meal}) do
    render_one(meal, QuantifiedSelfPhoenix.MealView, "meal.json")
  end

  def render("meal.json", %{meal: meal}) do
    %{id: meal.id,
      name: meal.name,
      foods: render_many(meal.foods, QuantifiedSelfPhoenix.FoodView, "food.json")}
  end
end
