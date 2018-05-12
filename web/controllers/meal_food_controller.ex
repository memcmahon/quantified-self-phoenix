defmodule QuantifiedSelfPhoenix.MealFoodController do
  use QuantifiedSelfPhoenix.Web, :controller

  alias QuantifiedSelfPhoenix.MealFood

  def create(conn, %{"id" => food_id, "meal_id" => meal_id}) do
    {food_id, _} = Integer.parse(food_id)
    {meal_id, _} = Integer.parse(meal_id)

    changeset = MealFood.changeset(%MealFood{food_id: food_id, meal_id: meal_id})

    case Repo.insert(changeset) do
      {:ok, meal_food} ->
        conn
        |> put_status(:created)
        |> render("show.json", meal_food: meal_food)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(QuantifiedSelfPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => food_id, "meal_id" => meal_id}) do
    {food_id, _} = Integer.parse(food_id)
    {meal_id, _} = Integer.parse(meal_id)

    meal_food = Repo.get_by!(MealFood, %{meal_id: meal_id, food_id: food_id})

    Repo.delete!(meal_food)

    send_resp(conn, :no_content, "")
  end
end
