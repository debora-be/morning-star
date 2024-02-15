defmodule MorningStarWeb.Graphql.Queries.VenusQueries do
  use Absinthe.Schema.Notation

  object :venus_queries do
    @desc "Get actual images from Venus + some medieval related mythic story"
    field :get_venus_image, list_of(:venus_image) do
      arg(:start_date, non_null(:string))
      arg(:end_date, non_null(:string))

      resolve(&MorningStarWeb.Graphql.Resolvers.VenusResolver.get_venus_image/3)
    end
  end
end
