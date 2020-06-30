defmodule JaTranslations.AccountsTest do
  use JaTranslations.DataCase

  alias JaTranslations.Accounts
  alias Argon2

  describe "users" do
    alias JaTranslations.Accounts.User

    @valid_attrs %{email: "SoMe@emaiL.com", is_admin: true, password: "some password", username: "some username"}
    @update_attrs %{email: "sOMEupDated@email.com", is_admin: false, password: "some updated password", username: "some updated username"}
    @invalid_attrs %{email: nil, is_admin: nil, password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "users cannot authenticate as admins" do
      plain_user = Map.merge(@valid_attrs, %{email: "plainuser@email.com", is_admin: false})
      admin = Map.merge(@valid_attrs, %{email: "admin@email.com", is_admin: true})

      Accounts.create_user(plain_user)
      Accounts.create_user(admin)

      assert {:error, :invalid_credentials} = Accounts.authenticate_admin(plain_user.email, plain_user.password)
      assert {:ok, _} = Accounts.authenticate_admin(admin.email, admin.password)
    end

    test "emails are unique" do
      Accounts.create_user(@valid_attrs)
      assert {:error, %Ecto.Changeset{} = changeset} = Accounts.create_user(@valid_attrs)
      assert [
        email: {
          msg,
          [constraint: :unique, constraint_name: name]
        }
      ] = changeset.errors
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some@email.com"
      assert user.is_admin == true
      assert {:ok, user} == Argon2.check_pass(user, "some password", hash_key: :password)
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "someupdated@email.com"
      assert user.is_admin == false
      assert {:ok, user} == Argon2.check_pass(user, "some updated password", hash_key: :password)
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
