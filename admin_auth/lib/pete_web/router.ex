defmodule PeteWeb.Router do
  use PeteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :with_session do
    plug Pete.Auth.Pipeline
    plug Pete.Auth.CurrentUser
  end

  pipeline :login_required do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :admin_required do
    plug Pete.Auth.CheckAdmin
  end

  scope "/", PeteWeb do
    pipe_through [:browser, :with_session]

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    scope "/admin" do
      pipe_through [:admin_required]

      resources "/", AdminController, only: [:index]
    end
  end
end
