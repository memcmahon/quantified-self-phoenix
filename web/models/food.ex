defmodule QuantifiedSelfPhoenix.Food do
  use QuantifiedSelfPhoenix.Web, :model

  schema "foods" do
    field :name, :string
    field :calories, :integer

    timestamps()

    many_to_many :meals, QuantifiedSelfPhoenix.Meal, join_through: "mealfoods"
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :calories])
    |> validate_required([:name, :calories])
  end
end
