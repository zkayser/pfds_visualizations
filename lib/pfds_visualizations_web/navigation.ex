defmodule PfdsVisualizationsWeb.Navigation do
  alias PfdsVisualizationsWeb.Router.Helpers
  alias PfdsVisualizationsWeb.Endpoint

  def links_for(current_path) do
    slides = %{
      "/" => %{next: Helpers.slide_path(Endpoint, :show, "1")},
      "/slides/1" => %{
        prev: Helpers.red_black_tree_path(Endpoint, :index, %{}),
        next: Helpers.slide_path(Endpoint, :show, "2")
      },
      "/slides/2" => %{
        prev: Helpers.slide_path(Endpoint, :show, "1")
      }
    }

    slides[current_path]
  end

  def sanitize_path(path) do
    ~r/(?<pure_path>.*)?/
    |> Regex.named_captures(path)
    |> Map.get("pure_path")
  end
end
