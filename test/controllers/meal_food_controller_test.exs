# defmodule QuantifiedSelfPhoenix.MealFoodControllerTest do
#   use QuantifiedSelfPhoenix.ConnCase
#
#   alias QuantifiedSelfPhoenix.MealFood
#   @valid_attrs %{}
#   @invalid_attrs %{}
#
#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end
#
#   test "lists all entries on index", %{conn: conn} do
#     conn = get conn, meal_food_path(conn, :index)
#     assert json_response(conn, 200)["data"] == []
#   end
#
#   test "shows chosen resource", %{conn: conn} do
#     meal_food = Repo.insert! %MealFood{}
#     conn = get conn, meal_food_path(conn, :show, meal_food)
#     assert json_response(conn, 200)["data"] == %{"id" => meal_food.id,
#       "meal_id" => meal_food.meal_id,
#       "food_id" => meal_food.food_id}
#   end
#
#   test "renders page not found when id is nonexistent", %{conn: conn} do
#     assert_error_sent 404, fn ->
#       get conn, meal_food_path(conn, :show, -1)
#     end
#   end
#
#   test "creates and renders resource when data is valid", %{conn: conn} do
#     conn = post conn, meal_food_path(conn, :create), meal_food: @valid_attrs
#     assert json_response(conn, 201)["data"]["id"]
#     assert Repo.get_by(MealFood, @valid_attrs)
#   end
#
#   test "does not create resource and renders errors when data is invalid", %{conn: conn} do
#     conn = post conn, meal_food_path(conn, :create), meal_food: @invalid_attrs
#     assert json_response(conn, 422)["errors"] != %{}
#   end
#
#   test "updates and renders chosen resource when data is valid", %{conn: conn} do
#     meal_food = Repo.insert! %MealFood{}
#     conn = put conn, meal_food_path(conn, :update, meal_food), meal_food: @valid_attrs
#     assert json_response(conn, 200)["data"]["id"]
#     assert Repo.get_by(MealFood, @valid_attrs)
#   end
#
#   test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
#     meal_food = Repo.insert! %MealFood{}
#     conn = put conn, meal_food_path(conn, :update, meal_food), meal_food: @invalid_attrs
#     assert json_response(conn, 422)["errors"] != %{}
#   end
#
#   test "deletes chosen resource", %{conn: conn} do
#     meal_food = Repo.insert! %MealFood{}
#     conn = delete conn, meal_food_path(conn, :delete, meal_food)
#     assert response(conn, 204)
#     refute Repo.get(MealFood, meal_food.id)
#   end
# end
