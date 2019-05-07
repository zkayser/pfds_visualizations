defmodule PfdsVisualizationsWeb.BankersQueueLiveView do
  use Phoenix.LiveView
  alias BankersQueue, as: Queue
  require Logger

  def mount(session, socket) do
    socket =
      socket
      |> assign(:queue, Queue.init())
      |> assign(:new_elem, "")
      |> assign(:current_operation, :snoc)

    {:ok, socket}
  end

  def render(assigns) do
    PfdsVisualizationsWeb.BankersQueueView.render("bankers_queue.html", assigns)
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
    # costs = calculate_costs(:snoc, socket.assigns.queue)
    queue = socket.assigns.queue |> Queue.snoc(String.to_integer(value["new_elem"]))

    socket =
      socket
      |> assign(:queue, queue)
      |> assign(:new_elem, "")

    # |> insert_cost_updates(costs)

    {:noreply, socket}
  end

  def handle_event("run_tail", _value, socket) do
    with {:ok, queue} <- Queue.tail(socket.assigns.queue) do
      # costs = calculate_costs(:tail, socket.assigns.queue)

      socket =
        socket
        |> assign(:queue, queue)

      {:noreply, socket}
    else
      _ -> {:noreply, socket}
    end
  end
end
