# defmodule QuantifiedSelfPhoenix.MealFoodController do
#   use QuantifiedSelfPhoenix.Web, :controller
#
#   alias QuantifiedSelfPhoenix.MealFood
#
#   def index(conn, _params) do
#     mealfoods = Repo.all(MealFood)
#     render(conn, "index.json", mealfoods: mealfoods)
#   end
#
#   def create(conn, %{"meal_food" => meal_food_params}) do
#     changeset = MealFood.changeset(%MealFood{}, meal_food_params)
#
#     case Repo.insert(changeset) do
#       {:ok, meal_food} ->
#         conn
#         |> put_status(:created)
#         |> put_resp_header("location", meal_food_path(conn, :show, meal_food))
#         |> render("show.json", meal_food: meal_food)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(QuantifiedSelfPhoenix.ChangesetView, "error.json", changeset: changeset)
#     end
#   end
#
#   def show(conn, %{"id" => id}) do
#     meal_food = Repo.get!(MealFood, id)
#     render(conn, "show.json", meal_food: meal_food)
#   end
#
#   def update(conn, %{"id" => id, "meal_food" => meal_food_params}) do
#     meal_food = Repo.get!(MealFood, id)
#     changeset = MealFood.changeset(meal_food, meal_food_params)
#
#     case Repo.update(changeset) do
#       {:ok, meal_food} ->
#         render(conn, "show.json", meal_food: meal_food)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(QuantifiedSelfPhoenix.ChangesetView, "error.json", changeset: changeset)
#     end
#   end
#
#   def delete(conn, %{"id" => id}) do
#     meal_food = Repo.get!(MealFood, id)
#
#     # Here we use delete! (with a bang) because we expect
#     # it to always work (and if it does not, it will raise).
#     Repo.delete!(meal_food)
#
#     send_resp(conn, :no_content, "")
#   end
# end
