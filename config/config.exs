# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pfds_visualizations,
  ecto_repos: [PfdsVisualizations.Repo]

# Configures the endpoint
config :pfds_visualizations, PfdsVisualizationsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GbkY7T1ujmURif2MZPXciGqVGHNUA3TDYKzWhY85s7iGa1InjbeCCTG9FJBxSrIJ",
  render_errors: [view: PfdsVisualizationsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PfdsVisualizations.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "ghuf0G0CCNoV1uWd9n6s7L5htTx/zMWSJeg2ty71x1f8YjAwv1pl8JvtgSNEl9q9"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
