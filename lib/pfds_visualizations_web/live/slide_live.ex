defmodule PfdsVisualizationsWeb.SlideLive do
  use Phoenix.LiveView

  def render(assigns) do
    PfdsVisualizationsWeb.SlideView.render("show.html", assigns)
  end

  def mount(session, socket) do
    IO.puts("Mounting SlideLive view with socket: #{inspect(socket)}")
    IO.puts("And the session value is: #{inspect(session)}")
    {:ok, assign(socket, id: session.id)}
  end
end
