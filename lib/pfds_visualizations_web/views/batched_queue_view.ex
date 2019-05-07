defmodule PfdsVisualizationsWeb.BatchedQueueView do
  use PfdsVisualizationsWeb, :view

  def render_queue({[], []}) do
    ~E"""
    <text text-anchor="middle" font-size="1em" x="50" y="25">Empty</text>
    """
  end

  def render_queue({front, rear}) do
    ~E"""
    <%= render_front(front, 0) %>
    <%= render_rear(rear, 0) %>
    """
  end

  defp render_front([], _), do: ""

  defp render_front([head | tail], start_x) do
    ~E"""
    <g>
      <rect x=<%= start_x %> y=25 width="10" height="10" stroke="black" fill="transparent" stroke-width="1" />
      <text text-anchor="middle" font-size="0.5em" x="<%= start_x + 5 %>" y="32.5"><%= head %></text>
    </g>
    <%= render_front(tail, start_x + 10) %>
    """
  end

  defp render_rear([], _), do: ""

  defp render_rear([head | tail], start_x) do
    ~E"""
    <g>
      <rect x=<%= start_x %> y=75 width="10" height="10" stroke="black" fill="transparent" stroke-width="1" />
      <text text-anchor="middle" font-size="0.5em" x="<%= start_x + 5 %>" y="82.5"><%= head %></text>
    </g>
    <%= render_rear(tail, start_x + 10) %>
    """
  end
end
