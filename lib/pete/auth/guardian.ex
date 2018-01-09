defmodule Pete.Auth.Guardian do
  use Guardian, otp_app: :pete

  alias Pete.{User, Repo}

  def subject_for_token(user = %User{}, _claims), do: {:ok, "User:#{user.id}"}
  def subject_for_token(_, _), do: {:error, :unknown_resource_type}

  def resource_from_claims(%{"sub" => sub}) do
    "User:" <> id = sub
    {:ok, Repo.get(User, id)}
  end
  def resource_from_claims(_), do: {:error, :unknown_resource_type}
end
