defmodule Inmana.Supplies.GetByExpiration do
  import Ecto.Query

  alias Inmana.{Repo, Restaurant, Supply}

  def call do
    today = Date.utc_today()
    bw = Date.beginning_of_week(today)
    ew = Date.end_of_week(today)

    query =
      from supply in Supply,
        where:
          supply.expiration_date >= ^bw and supply.expiration_date <= ^ew,
          preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)

  end

end
