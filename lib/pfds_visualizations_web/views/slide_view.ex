defmodule PfdsVisualizationsWeb.SlideView do
  use PfdsVisualizationsWeb, :view
  alias PfdsVisualizationsWeb, as: App

  def slide_for(id) do
    case id do
      "1" -> "intro.html"
      "2" -> "refresher.html"
      _ -> "intro.html"
    end
  end

  def reveals_for(id) do
    case id do
      "1" -> App.IntroView.reveals()
      "2" -> App.RefresherView.reveals()
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
