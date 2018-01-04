defmodule Pete.Counter do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pete.{Counter, User}


  schema "counters" do
    field :count, :integer

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Counter{} = counter, attrs) do
    counter
    |> cast(attrs, [:count])
    |> validate_required([:count])
    |> assoc_constraint(:user)
  end
end
