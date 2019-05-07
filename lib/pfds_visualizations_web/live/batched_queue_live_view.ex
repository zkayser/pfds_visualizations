defmodule PfdsVisualizationsWeb.BatchedQueueLiveView do
  use Phoenix.LiveView
  alias BatchedQueue, as: Queue
  require Logger

  def mount(session, socket) do
    socket =
      socket
      |> assign(:queue, Queue.empty())
      |> assign(:current_operation, :snoc)
      |> assign(:new_elem, "")
      |> assign(:total_amortized_cost, 0)
      |> assign(:total_actual_cost, 0)
      |> assign(:total_credits_allocated, 0)
      |> assign(:total_credits_spent, 0)
      |> assign(:total_savings, 0)

    {:ok, socket}
  end

  def render(assigns) do
    PfdsVisualizationsWeb.BatchedQueueView.render("batched_queue.html", assigns)
  end

  def handle_event("toggle_operation", _, %{assigns: %{current_operation: :snoc}} = socket) do
    {:noreply, assign(socket, :current_operation, :tail)}
  end

  def handle_event("toggle_operation", _, %{assigns: %{current_operation: :tail}} = socket) do
    {:noreply, assign(socket, :current_operation, :snoc)}
  end

  def handle_event("new_elem_change", value, socket) do
    socket =
      socket
      |> assign(:new_elem, value["new_elem"])

    {:noreply, socket}
  end

  def handle_event("add_new_elem", value, socket) do
    costs = calculate_costs(:snoc, socket.assigns.queue)
    queue = socket.assigns.queue |> Queue.snoc(String.to_integer(value["new_elem"]))

    socket =
      socket
      |> assign(:queue, queue)
      |> assign(:new_elem, "")
      |> insert_cost_updates(costs)

    {:noreply, socket}
  end

  def handle_event("run_tail", _value, socket) do
    with {:ok, queue} <- Queue.tail(socket.assigns.queue) do
      costs = calculate_costs(:tail, socket.assigns.queue)

      socket =
        socket
        |> assign(:queue, queue)
        |> insert_cost_updates(costs)

      {:noreply, socket}
    else
      _ -> {:noreply, socket}
    end
  end

  def handle_event(event, value, socket) do
    Logger.debug("Got unknown event with event: #{inspect(event)}")
    Logger.debug("Got unknown event with value: #{inspect(value)}")
    Logger.debug("Got unknown event with socket: #{inspect(socket)}")
    {:noreply, socket}
  end

  defp insert_cost_updates(socket, costs) do
    socket
    |> assign(
      :total_amortized_cost,
      socket.assigns.total_amortized_cost + costs.actual + costs.allocated - costs.spent
    )
    |> assign(:total_actual_cost, socket.assigns.total_actual_cost + costs.actual)
    |> assign(
      :total_credits_allocated,
      socket.assigns.total_credits_allocated + costs.allocated
    )
    |> assign(:total_credits_spent, socket.assigns.total_credits_spent + costs.spent)
    |> assign(
      :total_savings,
      socket.assigns.total_amortized_cost + costs.actual + costs.allocated - costs.spent -
        (socket.assigns.total_actual_cost + costs.actual)
    )
  end

  defp calculate_costs(:snoc, {[], []}) do
    %{actual: 1, allocated: 1, spent: 1}
  end

  defp calculate_costs(:snoc, _queue) do
    %{actual: 1, allocated: 1, spent: 0}
  end

  defp calculate_costs(:tail, {[_head], rear}) do
    %{actual: length(rear) + 1, allocated: 0, spent: length(rear)}
  end

  defp calculate_costs(:tail, _queue) do
    %{actual: 1, allocated: 0, spent: 0}
  end
end
