defmodule JaTranslations.Accounts.AdminPipeline do
  use Guardian.Plug.Pipeline,
  otp_app: :ja_translations,
  error_handler: JaTranslations.Accounts.ErrorHandler,
  module: JaTranslations.Accounts.Guardian

  # If there is a session token, restrict it to an access token and validate it
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access", "admin" => true}
  # If there is an authorization header, restrict it to an access token and validate it
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access", "admin" => true}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
