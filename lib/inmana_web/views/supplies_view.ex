defmodule InmanaWeb.SuppliesView do
  use InmanaWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Criado",
      supply: supply
    }

  end

  def render("show.json",  %{supply: supply}), do: %{supply: supply}#sintaxe de uma linha só
end
