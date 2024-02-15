defmodule MorningStar.Repo.Migrations.CreateVenusMythology do
  use Ecto.Migration

  def change do
    create table(:venus_mythology) do
      add :article_source, :string
      add :article_fragment, :text

      timestamps()
    end
  end
end
