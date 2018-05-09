defmodule QuantifiedSelfPhoenix.MealTest do
  use QuantifiedSelfPhoenix.ModelCase

  alias QuantifiedSelfPhoenix.Meal

  @valid_attrs %{name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Meal.changeset(%Meal{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Meal.changeset(%Meal{}, @invalid_attrs)
    refute changeset.valid?
  end
end
