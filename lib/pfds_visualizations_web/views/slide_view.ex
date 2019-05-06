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
      # "3" -> "refresher.html"
      _ -> "intro.html"
    end
  end

  def reveals_for(id) do
    case id do
      "1" -> App.IntroView.reveals()
      "2" -> App.DefinitionView.reveals()
      "3" -> [:reveal_1, :reveal_2]
      "4" -> [:reveal_1]
      "5" -> [:reveal_1, :reveal_2]
      "6" -> [:reveal_1]
      "7" -> [:reveal_1, :reveal_2]
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
end
