defmodule QuantifiedSelfPhoenix.FoodTest do
  use QuantifiedSelfPhoenix.ModelCase

  alias QuantifiedSelfPhoenix.Food

  @valid_attrs %{calories: 42, name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Food.changeset(%Food{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Food.changeset(%Food{}, @invalid_attrs)
    refute changeset.valid?
  end
end
