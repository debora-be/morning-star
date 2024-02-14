defmodule MorningStar.Models.VenusMythology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "venus_mythology" do
    field :title, :string
    field :content, :string
    field :source, :string

    timestamps()
  end

  def changeset(venus_mythology, attrs) do
    venus_mythology
    |> cast(attrs, [:title, :content, :source])
    |> validate_required([:title, :content, :source])
  end
end
