defmodule PfdsVisualizationsWeb.Router do
  use PfdsVisualizationsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PfdsVisualizationsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/red_black_trees", RedBlackTreeController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PfdsVisualizationsWeb do
  #   pipe_through :api
  # end
end
