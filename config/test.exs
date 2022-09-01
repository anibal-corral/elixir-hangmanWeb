import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hangman2App, Hangman2AppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zYhd2k07tl8Nb5q3sETkI8XRDNCr+3crsSm6UGLDC55sTPpCMspvuCZe0cLhXVja",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
