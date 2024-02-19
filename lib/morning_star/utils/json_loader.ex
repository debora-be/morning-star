defmodule MorningStar.Utils.JSONLoader do
  def load_json_to_db do
    file_path = "venus_mythology.json"

    file_path
    |> File.read!()
    |> Jason.decode!()
    |> Enum.each(fn %{"article_source" => source, "content" => content} ->
      Enum.each(content, fn %{"fragment" => fragment} ->
        insert_venus_mythology(fragment, source)
      end)
    end)
  end

  defp insert_venus_mythology(fragment, source) do
    %MorningStar.Models.VenusMythology{
      article_source: source,
      article_fragment: fragment
    }
    |> MorningStar.Models.VenusMythology.changeset(%{})
    |> MorningStar.Repo.insert()
  end
end
