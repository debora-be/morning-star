defmodule MorningStar.Models.VenusQueries do
  import Ecto.Query, only: [from: 2]

  def stories do
    records =
      MorningStar.Repo.all(
        from(v in MorningStar.Models.VenusMythology, select: v.article_fragment)
      )

    case records do
      [] -> {:error, :not_found}
      records -> {:ok, records}
    end
  end
end
