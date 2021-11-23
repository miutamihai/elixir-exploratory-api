defmodule DickingapiWeb.Router do
  use DickingapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DickingapiWeb do
    pipe_through :api
    get "/", ApiController, :reply
    get "/:person", ApiController, :reply
  end
end
