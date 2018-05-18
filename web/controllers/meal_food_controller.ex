defmodule QuantifiedSelfPhoenix.MealFoodController do
  use QuantifiedSelfPhoenix.Web, :controller

  alias QuantifiedSelfPhoenix.MealFood
  alias QuantifiedSelfPhoenix.Food
  alias QuantifiedSelfPhoenix.Meal

  def create(conn, %{"id" => food_id, "meal_id" => meal_id}) do
    food = Repo.get!(Food, food_id)
    meal = Repo.get!(Meal, meal_id)

    changeset = MealFood.changeset(%MealFood{food_id: food.id, meal_id: meal.id})

    case Repo.insert(changeset) do
      {:ok, meal_food} ->
        conn
        |> put_status(:created)
        |> render("show.json", message: "Successfully added #{food.name} to #{meal.name}")
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(QuantifiedSelfPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => food_id, "meal_id" => meal_id}) do
    food = Repo.get!(Food, food_id)
    meal = Repo.get!(Meal, meal_id)

    meal_food = Repo.get_by!(MealFood, %{meal_id: meal.id, food_id: food.id})

    Repo.delete!(meal_food)

    send_resp(conn, 204, "message: Successfully removed #{food.name} from #{meal.name}")
  end
end
