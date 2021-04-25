# agrupador de funções
defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    map = %{a: 1}
    map.a
    map2 = %{"name" => "Bruno", "age" => 38}

    %{age: x} = %{name: "Bruno", age: 38}
    IO.inspect(x)
    # name=params["name"]

    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
    |> IO.inspect()
  end

  def evaluate("Bruno", "38") do
    {:ok, "Vai dormir"}
  end

  def evaluate(name, age) when age > 18 do
    {:ok, "Oi #{name}"}
  end

  def evaluate(name, age) do
    {:error, "Tchau #{name}"}
  end
end
