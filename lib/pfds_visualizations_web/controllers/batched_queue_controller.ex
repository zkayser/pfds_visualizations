defmodule PfdsVisualizationsWeb.BatchedQueueController do
  use PfdsVisualizationsWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, PfdsVisualizationsWeb.BatchedQueueLiveView, session: %{})
  end
end
