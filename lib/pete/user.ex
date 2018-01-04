defmodule Pete.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pete.{User, Todo, Counter}
  alias Ecto.Changeset
  alias Comeonin.Bcrypt

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    has_many :todo, Todo
    has_many :counter, Counter

    timestamps()
  end

  @doc false
  @required_fields ~w(email)a
  @optional_filds ~w(name)a
  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, @required_fields ++ @optional_filds)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> cast(params, ~w(password)a, [])
    |> validate_length(:password, min: 6, max: 100)
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
      %Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
