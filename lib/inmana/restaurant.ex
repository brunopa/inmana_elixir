defmodule Inmana.Restaurant do
   use Ecto.Schema
   import Ecto.Changeset

   @primary_key {:id, :binary_id, autogenerate: true} #@ significa constante

   @required_params [:email, :name]

   @derive {Jason.Encoder, only: @required_params ++ [:id]}

   schema "restaurants" do
    field :email, :binary
    field :name, :binary

    timestamps()

   end

   def changeset(params) do #faz cast e validações
    %__MODULE__{}
    |>cast(params, @required_params)
    |>validate_required(@required_params)
    |>validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
