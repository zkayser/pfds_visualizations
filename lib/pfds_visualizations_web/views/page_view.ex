defmodule PfdsVisualizationsWeb.PageView do
  use PfdsVisualizationsWeb, :view

  def visualize(:empty, level \\ 0) do
    ~E"""
    <circle class="leaf-node" cy="<%= (level + 1) * 10 %>" cx="<%= (level + 1) * 10 %>" fill="black" />
    """
  end
  def visualize(%RedBlackTree{} = rb_tree, level) do
    color = Atom.to_string(rb_tree.color)
    %{level: level, tree: left_tree} = make_visualization(rb_tree.left)
    %{level: level, tree: right_tree} = make_visualization(rb_tree.right)
    left = visualize(left_tree, level)
    right = visualize(right_tree, level)
    ~E"""
      <circle fill="<%= color %>" cy="<%= (level + 1) * 10 %>" cx="<%= (level + 1) * 10 %>" r="3" />
      <%= left %>
      <%= right %>
    """
  end

  defp make_visualization(:empty), do: %{level: 0, tree: :empty}
  defp make_visualization(tree) do
    case tree do
      %RedBlackTree{} -> make_visualization_(tree, 0)
    end
  end

  defp make_visualization_(tree, level), do: %{level: level + 1, tree: tree}
end


### Render left child; render right child; place 2 units apart; render parent 1 unit up and
