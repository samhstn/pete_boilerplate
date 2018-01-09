defmodule PeteWeb.AdminController do
  use PeteWeb, :controller

  def index(conn, _) do
    render conn, "index.html"
  end
end
