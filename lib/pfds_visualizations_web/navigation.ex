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
        prev: Helpers.slide_path(Endpoint, :show, "1"),
        next: Helpers.slide_path(Endpoint, :show, "3")
      },
      "/slides/3" => %{
        prev: Helpers.slide_path(Endpoint, :show, "2"),
        next: Helpers.slide_path(Endpoint, :show, "4")
      },
      "/slides/4" => %{
        prev: Helpers.slide_path(Endpoint, :show, "3"),
        next: Helpers.slide_path(Endpoint, :show, "5")
      },
      "/slides/5" => %{
        prev: Helpers.slide_path(Endpoint, :show, "4"),
        next: Helpers.slide_path(Endpoint, :show, "6")
      },
      "/slides/6" => %{
        prev: Helpers.slide_path(Endpoint, :show, "5"),
        next: Helpers.slide_path(Endpoint, :show, "7")
      },
      "/slides/7" => %{
        prev: Helpers.slide_path(Endpoint, :show, "6")
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
