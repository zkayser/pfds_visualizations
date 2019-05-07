defmodule PfdsVisualizationsWeb.BatchedQueueView do
  use PfdsVisualizationsWeb, :view

  def render_queue({[], []}) do
    ~E"""
    """
  end

  def render_queue({front, rear}) do
    ~E"""
    <%= render_front_title(front) %>
    <%= render_front(front, -50) %>
    <%= render_rear_title(rear) %>
    <%= render_rear(rear, -50) %>
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

  defp render_front_title([]), do: ""

  defp render_front_title(_) do
    ~E"""
    <text text-anchor="middle" font-size="0.5em" x="-50" y="12.5">Front</text>
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

  defp render_rear_title([]), do: ""

  defp render_rear_title(_) do
    ~E"""
    <text text-anchor="middle" font-size="0.5em" x="-50" y="62.5">Rear</text>
    """
  end
end
