defmodule MorningStar.Parsers.ParseVenusData do
  @moduledoc """
  This module is responsible for parsing the data returned from the NASA API.
  """
  alias HTTPoison

  @doc """
  Parses the data returned from the NASA API for a given period.
  """
  @spec parse_data_for_period(Date.t(), Date.t(), map()) :: list()
  def parse_data_for_period(period_start, period_end, response_data) do
    response_data
    |> get_items_within_period(period_start, period_end)
    |> extract_image_details()
  end

  defp get_items_within_period(items, period_start, period_end) do
    Enum.filter(items, fn item ->
      date = get_date_from_item(item)
      Date.compare(date, period_start) != :lt and Date.compare(date, period_end) != :gt
    end)
  end

  defp get_date_from_item(item) do
    item["data"]
    |> List.first()
    |> Map.get("date_created")
    |> parse_date_from_datetime()
  end

  defp parse_date_from_datetime(datetime) do
    case DateTime.from_iso8601(datetime) do
      {:ok, datetime, _} -> datetime |> DateTime.to_date()
      {:error, _} -> parse_date_only(datetime)
    end
  end

  def parse_date_only(datetime) do
    case String.split(datetime, "T") do
      [date_str | _] -> Date.from_iso8601(date_str)
      _ -> nil
    end
  end

  defp extract_image_details(items) do
    Enum.map(items, fn item ->
      data = List.first(item["data"])
      link = List.first(item["links"])["href"]

      %{
        title: data["title"],
        link: link
      }
    end)
  end
end
