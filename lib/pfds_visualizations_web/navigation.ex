defmodule PfdsVisualizationsWeb.Navigation do
  alias PfdsVisualizationsWeb.Router.Helpers
  alias PfdsVisualizationsWeb.Endpoint

  @slides %{
    "/" => %{next: Helpers.red_black_tree_path(Endpoint, :index)},
    "/red_black_trees" => %{prev: Helpers.page_path(Endpoint, :index)}
  }

  def links_for(current_path) do
    @slides[current_path]
  end
end
