defmodule PfdsVisualizationsWeb.SlideView do
  use PfdsVisualizationsWeb, :view

  def slide_for(id) do
    case id do
      "1" -> "intro.html"
      "2" -> "refresher.html"
      _ -> "intro.html"
    end
  end
end
