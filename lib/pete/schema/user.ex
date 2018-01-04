defmodule Pete.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pete.Schema.User


  schema "app_users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password_hash, :is_admin])
    |> validate_required([:name, :email, :password_hash, :is_admin])
    |> unique_constraint(:email)
  end
end
