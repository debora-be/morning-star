defmodule MorningStarWeb.Graphql.Types.VenusTypes do
  use Absinthe.Schema.Notation

  object :venus_image do
    field :title, :string
    field :description, :string

    field :image_url, :string,
      resolve: fn image, _, _ ->
        {:ok, image.link}
      end

    field :date_created, :string
  end
end
