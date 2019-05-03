defmodule PfdsVisualizationsWeb.SlideController do
  use PfdsVisualizationsWeb, :controller

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", id: "#{id}")
  end
end
