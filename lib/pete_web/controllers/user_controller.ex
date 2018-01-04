defmodule PeteWeb.UserController do
  use PeteWeb, :controller

  alias Pete.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    # here will be an implementation
    conn
  end
end
