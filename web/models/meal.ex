defmodule QuantifiedSelfPhoenix.Meal do
  use QuantifiedSelfPhoenix.Web, :model

  schema "meals" do
    field :name, :string

    timestamps()

    many_to_many :foods, QuantifiedSelfPhoenix.Food, join_through: "mealfoods"
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
