defmodule PfdsVisualizationsWeb.SlideLive do
  use Phoenix.LiveView
  alias PfdsVisualizationsWeb.Endpoint

  def render(assigns) do
    PfdsVisualizationsWeb.SlideView.render("show.html", assigns)
  end

  def mount(session, socket) do
    :erlang.send_after(10, self(), :refresh_highlighting)

    socket =
      socket
      |> assign(:id, session.id)
      |> assign(:reveals, PfdsVisualizationsWeb.SlideView.reveals_for(session.id))
      |> assign(:revealed, [])

    {:ok, socket}
  end

  def handle_event(
        "live_slide_click",
        _value,
        %{assigns: %{id: id, reveals: [next | rest], revealed: revealed}} = socket
      ) do
    socket =
      socket
      |> assign(:reveals, rest)
      |> assign(:revealed, [next | revealed])

    :erlang.send_after(10, self(), :refresh_highlighting)
    {:noreply, socket}
  end

  def handle_event("live_slide_click", _value, %{assigns: %{reveals: []}} = socket) do
    {:noreply, socket}
  end

  def handle_event(event, value, socket) do
    IO.puts("Received unexpected event: #{inspect(event)}")
    IO.puts("With socket value: #{inspect(socket)}")
    {:noreply, socket}
  end

  def handle_info(:refresh_highlighting, socket) do
    Endpoint.broadcast("listeners:lobby", "refresh_highlighting", %{})
    {:noreply, socket}
  end
end
