import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :morning_star, MorningStar.Repo,
  username: "morning_star",
  password: "morning_pass",
  hostname: "mariadb",
  database: "morning_star_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :morning_star, MorningStarWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4002],
  secret_key_base: "kzM20pZbWbgwh0RPvCwgyHagQRsIir+9hk/WS4/iUNgcH7kGohOxefLWC/YCFdxk",
  server: false

# In test we don't send emails.
config :morning_star, MorningStar.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
