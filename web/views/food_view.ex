defmodule QuantifiedSelfPhoenix.FoodView do
  use QuantifiedSelfPhoenix.Web, :view

  def render("index.json", %{foods: foods}) do
    render_many(foods, QuantifiedSelfPhoenix.FoodView, "food.json")
  end

  def render("show.json", %{food: food}) do
    %{data: render_one(food, QuantifiedSelfPhoenix.FoodView, "food.json")}
  end

  def render("food.json", %{food: food}) do
    %{id: food.id,
      name: food.name,
      calories: food.calories}
  end
end
