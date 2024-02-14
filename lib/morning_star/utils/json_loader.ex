defmodule MorningStar.Utils.JSONLoader do
  def load_json_to_db do
    file_path = "venus_mythology.json"

    file_path
    |> File.read!()
    |> Jason.decode!()
    |> Enum.each(&insert_venus_mythology/1)
  end

  defp insert_venus_mythology(%{"title" => title, "content" => content} = _attrs) do
    %MorningStar.Models.VenusMythology{
      title: title,
      content: content
    }
    |> MorningStar.Repo.insert()
  end
end
