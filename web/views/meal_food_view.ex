defmodule QuantifiedSelfPhoenix.MealFoodView do
  use QuantifiedSelfPhoenix.Web, :view

  def render("index.json", %{mealfoods: mealfoods}) do
    %{data: render_many(mealfoods, QuantifiedSelfPhoenix.MealFoodView, "meal_food.json")}
  end

  def render("show.json", %{meal_food: meal_food}) do
    %{data: render_one(meal_food, QuantifiedSelfPhoenix.MealFoodView, "meal_food.json")}
  end

  def render("meal_food.json", %{meal_food: meal_food}) do
    %{id: meal_food.id,
      meal_id: meal_food.meal_id,
      food_id: meal_food.food_id}
  end
end
