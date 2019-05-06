defmodule PfdsVisualizationsWeb.SlideView do
  use PfdsVisualizationsWeb, :view
  alias PfdsVisualizationsWeb, as: App

  def slide_for(id) do
    case id do
      "1" -> "intro.html"
      "2" -> "definition.html"
      "3" -> "persistence.html"
      "4" -> "questioning_persistence.html"
      "5" -> "sharing.html"
      "6" -> "sharing_example.html"
      "7" -> "sharing_example_2.html"
      "8" -> "sharing_example_3.html"
      "9" -> "sharing_example_4.html"
      "10" -> "sharing_example_5.html"
      "11" -> "complex_sharing.html"
      "12" -> "binary_tree_sharing.html"
      # "3" -> "refresher.html"
      _ -> "intro.html"
    end
  end

  def reveals_for(id) do
    case id do
      "1" -> App.IntroView.reveals()
      "2" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4]
      "3" -> [:reveal_1, :reveal_2]
      "4" -> [:reveal_1, :reveal_2]
      "5" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4]
      "6" -> [:reveal_1]
      "7" -> [:reveal_1, :reveal_2]
      "8" -> [:reveal_1, :reveal_2]
      "9" -> []
      "10" -> [:reveal_1]
      "11" -> [:reveal_1]
      "12" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4, :reveal_5, :reveal_6, :reveal_7]
      # "3" -> App.RefresherView.reveals()
      _ -> []
    end
  end

  def show(reveal, revealed) do
    case reveal in revealed do
      true -> "visible"
      false -> "hidden"
    end
  end

  def render_visible(reveal, revealed) do
    "visibility: #{show(reveal, revealed)};"
  end
end
