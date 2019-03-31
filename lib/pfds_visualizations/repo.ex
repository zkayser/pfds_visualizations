defmodule PfdsVisualizations.Repo do
  use Ecto.Repo,
    otp_app: :pfds_visualizations,
    adapter: Ecto.Adapters.Postgres
end
