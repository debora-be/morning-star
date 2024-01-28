# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :morning_star,
  ecto_repos: [MorningStar.Repo],
  generators: [timestamp_type: :utc_datetime],
  username: "morning_star",
  password: "morning_pass",
  database: "morning_star_db",
  hostname: "mariadb",
  pool_size: 10

# Configures the endpoint
config :morning_star, MorningStarWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: MorningStarWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MorningStar.PubSub,
  live_view: [signing_salt: "GIvv21wK"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :morning_star, MorningStar.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
