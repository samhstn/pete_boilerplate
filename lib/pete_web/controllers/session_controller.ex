defmodule PeteWeb.SessionController do
  use PeteWeb, :controller

  plug :scrub_params, "session" when action in ~w(create)a

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    # here will be an implementation
    conn
  end

  def delete(conn, _) do
    # here will be an implementation
    conn
  end
end

