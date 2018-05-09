defmodule QuantifiedSelfPhoenix.MealView do
  use QuantifiedSelfPhoenix.Web, :view

  def render("index.json", %{meals: meals}) do
    %{data: render_many(meals, QuantifiedSelfPhoenix.MealView, "meal.json")}
  end

  def render("show.json", %{meal: meal}) do
    %{data: render_one(meal, QuantifiedSelfPhoenix.MealView, "meal.json")}
  end

  def render("meal.json", %{meal: meal}) do
    %{id: meal.id,
      name: meal.name}
  end
end
