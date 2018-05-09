defmodule QuantifiedSelfPhoenix.MealFood do
  use QuantifiedSelfPhoenix.Web, :model

  schema "mealfoods" do
    belongs_to :meal, QuantifiedSelfPhoenix.Meal, foreign_key: :meal_id
    belongs_to :food, QuantifiedSelfPhoenix.Food, foreign_key: :food_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
