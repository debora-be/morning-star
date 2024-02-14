defmodule MorningStarWeb.Graphql.Queries.VenusQueries do
  use Absinthe.Schema.Notation

  object :venus_queries do
    @desc "Get images from Venus"
    field :get_venus_images, list_of(:venus_image) do
      arg(:start_date, non_null(:string))
      arg(:end_date, non_null(:string))

      resolve(&MorningStarWeb.Graphql.Resolvers.VenusResolver.get_venus_images/3)
    end
  end
end
