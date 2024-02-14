defmodule MorningStarWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Plug.Types)
  import_types(MorningStarWeb.Graphql.Types.VenusTypes)
  import_types(MorningStarWeb.Graphql.Queries.VenusQueries)

  query do
    import_fields(:venus_queries)
  end
end
