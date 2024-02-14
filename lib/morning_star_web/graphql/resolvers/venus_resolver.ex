defmodule MorningStarWeb.Graphql.Resolvers.VenusResolver do
  @moduledoc """
  This module is responsible for defining resolvers for Venus.
  """

  def get_venus_images(_parent, args, _info) do
    start_date = Date.from_iso8601(args.start_date)
    end_date = Date.from_iso8601(args.end_date)

    with {:ok, start_date} <- start_date,
         {:ok, end_date} <- end_date,
         {:ok, response} <- MorningStar.Adapters.SpaceshipAgencyClient.get_venus_data(),
         {:ok, decoded_response} <- Jason.decode(response.body) do
      parsed_data =
        MorningStar.Parsers.ParseVenusData.parse_data_for_period(
          start_date,
          end_date,
          decoded_response["collection"]["items"]
        )

      {:ok, parsed_data}
    else
      _error -> {:error, "Failed to fetch Venus images"}
    end
  end
end
