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
    Logger.debug("Hi from new_elem_change")

    socket =
      socket
      |> assign(:new_elem, value["new_elem"])

    {:noreply, socket}
  end

  def handle_event("add_new_elem", value, socket) do
    queue = socket.assigns.queue |> Queue.snoc(String.to_integer(value["new_elem"]))

    socket =
      socket
      |> assign(:queue, queue)
      |> assign(:new_elem, "")

    {:noreply, assign(socket, :queue, queue)}
  end

  def handle_event(event, value, socket) do
    Logger.debug("Got unknown event with event: #{inspect(event)}")
    Logger.debug("Got unknown event with value: #{inspect(value)}")
    Logger.debug("Got unknown event with socket: #{inspect(socket)}")
    {:noreply, socket}
  end
end
