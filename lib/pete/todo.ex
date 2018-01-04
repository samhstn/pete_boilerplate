defmodule Pete.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pete.{Todo, User}

  schema "todos" do
    field :name, :string
    field :state, :integer

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [:name, :state])
    |> validate_required([:name, :state])
  end
end
