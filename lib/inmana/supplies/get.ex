defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}
  def call(uuid) do
    case Repo.get(Supply, uuid)do
      nil ->  {:error, %{result: "Não encontrado", status: :not_found}}
      supply -> {:ok, supply}
    end
  end
end
