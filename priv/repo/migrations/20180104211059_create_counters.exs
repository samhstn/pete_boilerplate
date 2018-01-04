defmodule Pete.Repo.Migrations.CreateCounters do
  use Ecto.Migration

  def change do
    create table(:counters) do
      add :count, :integer

      timestamps()
    end

  end
end
