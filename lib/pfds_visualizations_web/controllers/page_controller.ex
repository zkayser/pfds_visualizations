defmodule PfdsVisualizationsWeb.PageController do
  use PfdsVisualizationsWeb, :controller

  def index(conn, _params) do
    rb_tree = RedBlackTree.insert(RedBlackTree.empty(), 5)
    |> RedBlackTree.insert(10)
    |> RedBlackTree.insert(25)
    |> RedBlackTree.insert(50)
    |> RedBlackTree.insert(15)
    render(conn, "index.html", rb_tree: rb_tree)
  end
end
