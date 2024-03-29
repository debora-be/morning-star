defmodule MorningStarWeb.Router do
  use MorningStarWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug :accepts, ["json"]
  end

  scope "/v1/graphql" do
    pipe_through [:api, :graphql]

    if Mix.env() == :dev do
      forward "/ui", Absinthe.Plug.GraphiQL,
        interface: :playground,
        schema: MorningStarWeb.Schema
    end

    forward "/", Absinthe.Plug, schema: MorningStarWeb.Schema
  end

  scope "/api", MorningStarWeb do
    pipe_through :api
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:morning_star, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: MorningStarWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
