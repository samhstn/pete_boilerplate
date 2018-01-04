defmodule Pete.Repo.Migrations.CreateAppTodos do
  use Ecto.Migration

  def change do
    create table(:app_todos) do
      add :name, :string
      add :state, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:app_todos, [:user_id])
  end
end
