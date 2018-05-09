defmodule QuantifiedSelfPhoenix.Router do
  use QuantifiedSelfPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", QuantifiedSelfPhoenix do
    pipe_through :api
  end
end
