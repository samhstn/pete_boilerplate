defmodule PeteWeb.SessionController do
  use PeteWeb, :controller

  alias Pete.Auth

  plug :scrub_params, "session" when action in ~w(create)a

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    result = Auth.login_by_email_and_pass conn, email, password

    case result do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "You’re now logged in!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    IO.puts "DELETING!!!"
    conn
    |> Auth.logout
    |> put_flash(:info, "See you later!")
    |> redirect(to: session_path(conn, :new))
  end
end

