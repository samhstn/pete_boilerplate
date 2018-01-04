defmodule Pete.Repo.Migrations.CreateAppUsers do
  use Ecto.Migration

  def change do
    create table(:app_users) do
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:app_users, [:email])
  end
end
