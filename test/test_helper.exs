{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(JaTranslations.Repo, :manual)

defmodule AuthHelper do
  use JaTranslationsWeb.ConnCase
  import JaTranslations.Factory

  def sign_in_admin(conn) do
    user = insert(:admin)
    {:ok, jwt, _claims} = Guardian.encode_and_sign( user, %{"some" => "claim"})
    conn =
      conn
      |> put_req_header("authorization", "Bearer #{jwt}")

      conn
  end
end
