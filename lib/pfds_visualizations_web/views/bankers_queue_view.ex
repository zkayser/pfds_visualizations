defmodule PfdsVisualizationsWeb.BankersQueueView do
  use PfdsVisualizationsWeb, :view

  def render_queue(queue) do
    ~E"""

    <text text-anchor="middle" font-size="0.5em" x="-50" y="12.5">
    <%= if queue.length_f != 0 do %>
    Front
    <% else %>
    (Empty)
    <% end %>
    </text>

    <%= render_front(to_list(queue.front), -50) %>
    <text text-anchor="middle" font-size="0.5em" x="-50" y="62.5">
    <%= if queue.length_f != 0 do %>
    Rear
    <% else %>
    (Empty)
    <% end %>
    </text>
    <%= render_rear(to_list(queue.rear), -50) %>
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

  defp to_list(stream) do
    case Suspension.force(stream) do
      :empty -> []
      %{head: head, tail: tail} -> to_list_(tail, [head]) |> :lists.reverse()
    end
  end

  defp to_list_(stream, list) do
    case Suspension.force(stream) do
      :empty -> list
      %{head: head, tail: tail} -> to_list_(tail, [head | list])
    end
  end
end
