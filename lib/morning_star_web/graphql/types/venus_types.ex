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

    field :that_daily_mythological_stuff, :string do
      resolve(&MorningStarWeb.Graphql.Resolvers.VenusResolver.get_venus_story/3)
    end
  end
end
