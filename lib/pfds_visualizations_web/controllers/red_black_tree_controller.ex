defmodule PfdsVisualizationsWeb.RedBlackTreeController do
  use PfdsVisualizationsWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    rb_tree =
      Enum.reduce(1..5, RedBlackTree.empty(), fn x, tree ->
        RedBlackTree.insert(tree, x)
      end)

    LiveView.Controller.live_render(conn, PfdsVisualizationsWeb.TreeView,
      session: %{
        rb_tree: rb_tree,
        grid: PfdsVisualizationsWeb.RedBlackTreeView.make_grid(rb_tree)
      }
    )
  end
end
