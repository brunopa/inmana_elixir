defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "siri@cascudo.com", name: "Siri cascudo"},
               valid?: true
             } = response #nao usa == pq eh um pattern mach
    end

    test "when there are invalid params, return invalid changeset" do
      params = %{name: "S", email: ""}

      expected_response = %{
        email: ["can't be blank"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
