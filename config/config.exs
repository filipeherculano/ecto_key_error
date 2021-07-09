import Config

config :poc, Poc.Repo,
  database: "poc_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox


config :poc,
  ecto_repos: [Poc.Repo]
