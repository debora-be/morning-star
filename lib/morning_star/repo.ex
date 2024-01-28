defmodule MorningStar.Repo do
  use Ecto.Repo,
    otp_app: :morning_star,
    adapter: Ecto.Adapters.MyXQL
end
