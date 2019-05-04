defmodule PfdsVisualizationsWeb.ListenersChannel do
  use Phoenix.Channel

  def join("listeners:" <> _rest, _message, socket) do
    {:ok, socket}
  end
end
