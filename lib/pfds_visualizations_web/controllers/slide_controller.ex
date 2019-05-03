defmodule PfdsVisualizationsWeb.SlideController do
  use PfdsVisualizationsWeb, :controller
  alias Phoenix.LiveView

  def show(conn, %{"id" => id}) do
    LiveView.Controller.live_render(conn, PfdsVisualizationsWeb.SlideLive, session: %{id: id})
    # render(conn, "show.html", id: "#{id}")
  end
end
