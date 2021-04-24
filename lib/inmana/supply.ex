defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  @primary_key {:id, :binary_id, autogenerate: true} #@ significa constante

  @required_params [:description, :expiration_date, :responsible, :restaurant_id]
  @foreign_key_type :binary_id

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string

    belongs_to :restaurant, Restaurant

   timestamps()

  end

  def changeset(params) do #faz cast e validações
   %__MODULE__{}
   |>cast(params, @required_params)
   |>validate_required(@required_params)
 end
end
