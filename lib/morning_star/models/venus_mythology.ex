defmodule MorningStar.Models.VenusMythology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "venus_mythology" do
    field :article_source, :string
    field :article_fragment, :string

    timestamps()
  end

  def changeset(venus_mythology, attrs) do
    venus_mythology
    |> cast(attrs, [:article_source, :article_fragment])
    |> validate_required([:article_source, :article_fragment])
  end
end
