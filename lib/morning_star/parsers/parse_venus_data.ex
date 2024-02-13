defmodule MorningStar.Parsers.ParseVenusData do
  @moduledoc """
  This module is responsible for parsing the data returned from the NASA API.
  """

  require Logger

  @doc """
  Parses the provided data for a given period, extracting date_created, description, and a random related image.
  """
  @spec parse_data_for_period(Date.t(), Date.t(), list()) :: [map()]
  def parse_data_for_period(period_start, period_end, items) do
    items
    |> Enum.filter(&item_within_period?(&1, period_start, period_end))
    |> Enum.map(&extract_image_details/1)
  end

  defp item_within_period?(item, period_start, period_end) do
    date = get_date_from_item(item)
    date && Date.compare(date, period_start) != :lt && Date.compare(date, period_end) != :gt
  end

  defp get_date_from_item(item) do
    item["data"]
    |> List.first()
    |> Map.get("date_created")
    |> parse_date_from_datetime()
  end

  defp parse_date_from_datetime(datetime) do
    case DateTime.from_iso8601(datetime) do
      {:ok, datetime, _} -> DateTime.to_date(datetime)
      {:error, _} -> nil
    end
  end

  defp extract_image_details(item) do
    data = List.first(item["data"])
    link = Enum.random(item["links"])["href"]

    %{
      date_created: data["date_created"],
      description: data["description"],
      link: link
    }
  end
end
