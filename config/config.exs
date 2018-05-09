# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :quantified_self_phoenix,
  ecto_repos: [QuantifiedSelfPhoenix.Repo]

# Configures the endpoint
config :quantified_self_phoenix, QuantifiedSelfPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pj06y1XcFidECPIBL2ggvlnOCBPyaQX4UH7ZFGNkh20t6CO0ME1cq88ottb9pZ86",
  render_errors: [view: QuantifiedSelfPhoenix.ErrorView, accepts: ~w(json)],
  pubsub: [name: QuantifiedSelfPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
