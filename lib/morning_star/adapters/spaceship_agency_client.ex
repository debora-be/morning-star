defmodule MorningStar.Adapters.SpaceshipAgencyClient do
  @moduledoc """
  This module is responsible for interacting with the NASA API.
  """

  @api_base "https://images-api.nasa.gov"

  @doc """
  Fetches data from the NASA API for Venus.
  """
  @spec get_venus_data() :: {:ok, map()} | {:error, any()}
  def get_venus_data do
    url = "#{@api_base}/search?q=Venus"
    HTTPoison.get(url)
  end
end
