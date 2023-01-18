defmodule SvgLiveDemo.Repo do
  use Ecto.Repo,
    otp_app: :svg_live_demo,
    adapter: Ecto.Adapters.Postgres
end
