defmodule QuantifiedSelfPhoenix.MealFoodView do
  use QuantifiedSelfPhoenix.Web, :view

  def render("show.json", %{message: message}) do
    %{message: message}
  end
end
