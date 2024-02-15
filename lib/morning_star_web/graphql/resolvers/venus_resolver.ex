defmodule MorningStarWeb.Graphql.Resolvers.VenusResolver do
  @moduledoc """
  This module is responsible for defining resolvers for Venus.
  """

  def get_venus_image(_parent, args, _info) do
    start_date = Date.from_iso8601!(args.start_date)
    end_date = Date.from_iso8601!(args.end_date)

    with {:ok, response} <- MorningStar.Adapters.SpaceshipAgencyClient.get_venus_data(),
         {:ok, decoded_response} <- Jason.decode(response.body) do
      parsed_data =
        MorningStar.Parsers.ParseVenusData.parse_data_for_period(
          start_date,
          end_date,
          decoded_response["collection"]["items"]
        )
        |> Enum.take_random(1)

      {:ok, parsed_data}
    else
      _error -> {:error, :bad_request}
    end
  end

  def get_venus_story(_parent, _args, _info) do
    case MorningStar.Models.VenusQueries.stories() do
      {:ok, content} ->
        fragment = Enum.random(content)

        {:ok, fragment}

      {:error, :not_found} ->
        {:error, :not_found}
    end
  end
end
