defmodule Pete.Auth do
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias Pete.{User, Repo, Auth.Guardian}

  def login(conn, user),
    do: Guardian.Plug.sign_in conn, user

  def login_by_email_and_pass(conn, email, given_pass) do
    user = Repo.get_by User, email: email

    cond do
      user && checkpw(given_pass, user.password_hash) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def logout(conn),
    do: Guardian.Plug.sign_out conn
end
