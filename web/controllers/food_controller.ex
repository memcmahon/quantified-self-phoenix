defmodule QuantifiedSelfPhoenix.FoodController do
  use QuantifiedSelfPhoenix.Web, :controller
  require IEx

  alias QuantifiedSelfPhoenix.Food

  def index(conn, _params) do
    foods = Repo.all(Food)
    render(conn, "index.json", foods: foods)
  end

  def create(conn, _params) do
    {_status, data, _conn_info} = read_body(conn)
    food_params = Poison.Parser.parse!(data)["food"]

    changeset = Food.changeset(%Food{}, food_params)

    case Repo.insert(changeset) do
      {:ok, food} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", food_path(conn, :show, food))
        |> render("show.json", food: food)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(QuantifiedSelfPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    food = Repo.get!(Food, id)
    render(conn, "show.json", food: food)
  end

  def update(conn, %{"id" => id}) do
    food = Repo.get!(Food, id)
    {_status, data, _conn_info} = read_body(conn)
    food_params = Poison.Parser.parse!(data)["food"]

    changeset = Food.changeset(food, food_params)

    case Repo.update(changeset) do
      {:ok, food} ->
        render(conn, "show.json", food: food)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(QuantifiedSelfPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    food = Repo.get!(Food, id)

    Repo.delete!(food)

    send_resp(conn, :no_content, "")
  end
end
