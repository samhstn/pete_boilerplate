defmodule Pete.Schema.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pete.Schema.Todo


  schema "app_todos" do
    field :name, :string
    field :state, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [:name, :state])
    |> validate_required([:name, :state])
  end
end
