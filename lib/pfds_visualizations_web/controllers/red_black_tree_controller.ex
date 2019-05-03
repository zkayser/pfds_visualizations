defmodule PfdsVisualizationsWeb.RedBlackTreeController do
  use PfdsVisualizationsWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    rb_tree =
      RedBlackTree.empty()
      |> RedBlackTree.insert(500)

    LiveView.Controller.live_render(conn, PfdsVisualizationsWeb.RedBlackTreeLiveView,
      session: %{
        rb_tree: rb_tree,
        grid: PfdsVisualizationsWeb.RedBlackTreeView.make_grid(rb_tree)
      }
    )
  end
end
