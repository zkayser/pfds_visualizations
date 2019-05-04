defmodule PfdsVisualizationsWeb.SlideLive do
  use Phoenix.LiveView
  alias PfdsVisualizationsWeb.Endpoint

  def render(assigns) do
    PfdsVisualizationsWeb.SlideView.render("show.html", assigns)
  end

  def mount(session, socket) do
    :erlang.send_after(10, self(), :refresh_highlighting)
    {:ok, assign(socket, id: session.id)}
  end

  def handle_event("live_slide_click", _value, socket) do
    {:noreply, socket}
  end

  def handle_event(event, value, socket) do
    IO.puts("Received unexpected event: #{inspect(event)}")
    {:noreply, socket}
  end

  def handle_info(:refresh_highlighting, socket) do
    Endpoint.broadcast("listeners:lobby", "refresh_highlighting", %{})
    {:noreply, socket}
  end
end
