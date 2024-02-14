defmodule MorningStarWeb.Graphql.Types.VenusTypes do
  use Absinthe.Schema.Notation

  import Ecto.Query

  object :venus_image do
    field :title, :string
    field :description, :string

    field :image_url, :string,
      resolve: fn image, _, _ ->
        {:ok, image.link}
      end

    field :date_created, :string

    field :that_daily_mythological_stuff, :string do
      resolve(fn _, _, _ ->
        records =
          MorningStar.Repo.all(from(v in MorningStar.Models.VenusMythology, select: v.content))

        case Enum.random(records) do
          nil -> {:error, "No content found"}
          content -> {:ok, content}
        end
      end)
    end
  end
end
