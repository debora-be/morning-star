defmodule MorningStar.Repo.Migrations.CreateVenusMythology do
  use Ecto.Migration

  def change do
    create table(:venus_mythology) do
      add :title, :string
      add :content, :text
      add :source, :string

      timestamps()
    end
  end
end
