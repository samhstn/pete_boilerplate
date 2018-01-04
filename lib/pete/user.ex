defmodule Pete.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pete.{User, Todo, Counter}

  schema "users" do
    field :email, :string
    field :password_hash, :string

    has_many :todo, Pete.Todo
    has_many :counter, Pete.Counter

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
    |> unique_constraint(:email)
  end
end
