defmodule PfdsVisualizationsWeb.PageView do
  use PfdsVisualizationsWeb, :view
  alias :math, as: Math

  def visualize(rb_tree, level, root_depth, {x, y} \\ {50, 10}) do
    color = if rb_tree == :empty, do: "black", else: Atom.to_string(rb_tree.color)
    spread_factor = Math.pow(2, root_depth - 2 - level) * 6
    case rb_tree do
      :empty -> ~E"""
      <g>
        <circle class="leaf-node" fill="<%= color %>" cy="<%= y %>" cx="<%= x %>" r="3" />
        <text text-anchor="middle" fill="white" font-size="0.2em" x="<%= x %>" y="<%= y + 1 %>">E</text>
      </g>
      """
      %RedBlackTree{left: left_tree, right: right_tree, element: el} ->
      left = visualize(left_tree, level + 1, root_depth, {x - spread_factor, y + 10})
      right = visualize(right_tree, level + 1, root_depth, {x + spread_factor, y + 10})
      ~E"""
        <g>
          <circle fill="<%= color %>" cy="<%= y %>" cx="<%= x %>" r="3" />
          <text text-anchor="middle" fill="white" font-size="0.2em" x="<%= x %>" y="<%= y + 1 %>"><%= el %></text>
        </g>
        <line x1="<%= x %>" y1="<%= y + 3 %>" x2="<%= x - spread_factor %>" y2="<%= y + 10 %>" stroke="black"
              stroke-width="0.1"
        />
        <%= left %>
        <line x1="<%= x %>" y1="<%= y + 3 %>" x2="<%= x + spread_factor %>" y2="<%= y + 10 %>" stroke="black"
              stroke-width="0.1"
        />
        <%= right %>
      """
    end
  end
end
