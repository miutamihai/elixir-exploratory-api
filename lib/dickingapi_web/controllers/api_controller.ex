defmodule DickingapiWeb.ApiController do
  use DickingapiWeb, :controller

  defp make_response(conn, :mihai) do
    person = %{
      id: 1,
      name: "Mihai"
    }

    json(conn, person)
  end

  defp make_response(conn, :other) do
    person = %{
      id: "Whatever",
      name: "Other Person"
    }

    json(conn, person)
  end

  def reply(conn, %{"person" => person}) do
    compute_reply = fn
      "mihai" -> make_response(conn, :mihai)
      "Mihai" -> make_response(conn, :mihai)
      _ -> make_response(conn, :other)
    end

    compute_reply.(person)
  end

  def reply(conn, _params) do
    text(conn, "Nothing to see here")
  end
end