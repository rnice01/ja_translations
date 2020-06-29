defmodule JaTranslations.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Argon2

  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :password, :string
    field :username, :string

    timestamps()
  end

  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :password, :is_admin])
    |> validate_required([:email, :username, :password, :is_admin])
    |> unique_constraint(:email)
    |> normalize_email()
    |> password_hash()
  end

  defp normalize_email(%Ecto.Changeset{valid?: true, changes: %{email: email}} = changeset) do
    change(changeset, email: String.downcase(email))
  end

  defp normalize_email(changeset), do: changeset

  defp password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp password_hash(changeset), do: changeset
end
