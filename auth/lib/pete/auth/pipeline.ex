defmodule Pete.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :pete,
    error_handler: Pete.Auth.ErrorHandler,
    module: Pete.Auth.Guardian

	plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end

