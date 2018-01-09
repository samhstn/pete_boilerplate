defmodule PeteWeb.ViewHelpers do
  @doc"""
  Returns the current path for a given `conn`

  iex>js_file(%{request_path: "/"})
  "home.js"
  iex>js_file(%{request_path: "/settings"})
  "settings.js"
  """
  def js_file(%{request_path: "/"}),
    do: "home.js"
  def js_file(%{request_path: "/" <> file}) when file in ~w(notdecidedroute),
    do: file <> ".js"
	def js_file(_), do: "none.js"
end

