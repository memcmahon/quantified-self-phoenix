defmodule QuantifiedSelfPhoenix.MealControllerTest do
  use QuantifiedSelfPhoenix.ConnCase

  alias QuantifiedSelfPhoenix.Meal
  @valid_attrs %{name: "some name"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, meal_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  # test "shows chosen resource", %{conn: conn} do
  #   meal = Repo.insert! %Meal{}
  #   conn = get conn, meal_path(conn, :show, meal)
  #   assert json_response(conn, 200)["data"] == %{"id" => meal.id,
  #     "name" => meal.name}
  # end
  #
  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, meal_path(conn, :show, -1)
  #   end
  # end
end
