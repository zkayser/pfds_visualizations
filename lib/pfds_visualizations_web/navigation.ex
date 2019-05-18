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
        prev: Helpers.slide_path(Endpoint, :show, "6"),
        next: Helpers.slide_path(Endpoint, :show, "8")
      },
      "/slides/8" => %{
        prev: Helpers.slide_path(Endpoint, :show, "7"),
        next: Helpers.slide_path(Endpoint, :show, "9")
      },
      "/slides/9" => %{
        prev: Helpers.slide_path(Endpoint, :show, "8"),
        next: Helpers.slide_path(Endpoint, :show, "10")
      },
      "/slides/10" => %{
        prev: Helpers.slide_path(Endpoint, :show, "9"),
        next: Helpers.slide_path(Endpoint, :show, "11")
      },
      "/slides/11" => %{
        prev: Helpers.slide_path(Endpoint, :show, "10"),
        next: Helpers.slide_path(Endpoint, :show, "12")
      },
      "/slides/12" => %{
        prev: Helpers.slide_path(Endpoint, :show, "11"),
        next: Helpers.slide_path(Endpoint, :show, "13")
      },
      "/slides/13" => %{
        prev: Helpers.slide_path(Endpoint, :show, "12"),
        next: Helpers.slide_path(Endpoint, :show, "14")
      },
      "/slides/14" => %{
        prev: Helpers.slide_path(Endpoint, :show, "13"),
        next: Helpers.slide_path(Endpoint, :show, "15")
      },
      "/slides/15" => %{
        prev: Helpers.slide_path(Endpoint, :show, "14"),
        next: Helpers.slide_path(Endpoint, :show, "16")
      },
      "/slides/16" => %{
        prev: Helpers.slide_path(Endpoint, :show, "15"),
        next: Helpers.slide_path(Endpoint, :show, "17")
      },
      "/slides/17" => %{
        prev: Helpers.slide_path(Endpoint, :show, "16"),
        next: Helpers.slide_path(Endpoint, :show, "18")
      },
      "/slides/18" => %{
        prev: Helpers.slide_path(Endpoint, :show, "17"),
        next: Helpers.slide_path(Endpoint, :show, "19")
      },
      "/slides/19" => %{
        prev: Helpers.slide_path(Endpoint, :show, "18"),
        next: Helpers.slide_path(Endpoint, :show, "20")
      },
      "/slides/20" => %{
        prev: Helpers.slide_path(Endpoint, :show, "19"),
        next: Helpers.slide_path(Endpoint, :show, "21")
      },
      "/slides/21" => %{
        prev: Helpers.slide_path(Endpoint, :show, "20"),
        next: Helpers.slide_path(Endpoint, :show, "22")
      },
      "/slides/22" => %{
        prev: Helpers.slide_path(Endpoint, :show, "21"),
        next: Helpers.slide_path(Endpoint, :show, "23")
      },
      "/slides/23" => %{
        prev: Helpers.slide_path(Endpoint, :show, "22"),
        next: Helpers.slide_path(Endpoint, :show, "24")
      },
      "/slides/24" => %{
        prev: Helpers.slide_path(Endpoint, :show, "23"),
        next: Helpers.slide_path(Endpoint, :show, "25")
      },
      "/slides/25" => %{
        prev: Helpers.slide_path(Endpoint, :show, "24"),
        next: Helpers.slide_path(Endpoint, :show, "26")
      },
      "/slides/26" => %{
        prev: Helpers.slide_path(Endpoint, :show, "25"),
        next: Helpers.slide_path(Endpoint, :show, "27")
      },
      "/slides/27" => %{
        prev: Helpers.slide_path(Endpoint, :show, "26"),
        next: Helpers.slide_path(Endpoint, :show, "28")
      },
      "/slides/28" => %{
        prev: Helpers.slide_path(Endpoint, :show, "27"),
        next: Helpers.slide_path(Endpoint, :show, "29")
      },
      "/slides/29" => %{
        prev: Helpers.slide_path(Endpoint, :show, "28"),
        next: Helpers.slide_path(Endpoint, :show, "30")
      },
      "/slides/30" => %{
        prev: Helpers.slide_path(Endpoint, :show, "29"),
        next: Helpers.slide_path(Endpoint, :show, "31")
      },
      "/slides/31" => %{
        prev: Helpers.slide_path(Endpoint, :show, "30"),
        next: Helpers.slide_path(Endpoint, :show, "32")
      },
      "/slides/32" => %{
        prev: Helpers.slide_path(Endpoint, :show, "30"),
        next: Helpers.slide_path(Endpoint, :show, "33")
      },
      "/slides/33" => %{
        prev: Helpers.slide_path(Endpoint, :show, "32"),
        next: Helpers.slide_path(Endpoint, :show, "34")
      },
      "/slides/34" => %{
        prev: Helpers.slide_path(Endpoint, :show, "33"),
        next: Helpers.slide_path(Endpoint, :show, "35")
      },
      "/slides/35" => %{
        prev: Helpers.slide_path(Endpoint, :show, "34"),
        next: Helpers.slide_path(Endpoint, :show, "36")
      },
      "/slides/36" => %{
        prev: Helpers.slide_path(Endpoint, :show, "35"),
        next: Helpers.batched_queue_path(Endpoint, :index)
      },
      "/batched_queue" => %{
        prev: Helpers.slide_path(Endpoint, :show, "36"),
        next: Helpers.slide_path(Endpoint, :show, "37")
      },
      "/slides/37" => %{
        prev: Helpers.batched_queue_path(Endpoint, :index),
        next: Helpers.slide_path(Endpoint, :show, "38")
      },
      "/slides/38" => %{
        prev: Helpers.slide_path(Endpoint, :show, "37"),
        next: Helpers.slide_path(Endpoint, :show, "39")
      },
      "/slides/39" => %{
        prev: Helpers.slide_path(Endpoint, :show, "38"),
        next: Helpers.slide_path(Endpoint, :show, "48")
      },
      "/slides/40" => %{
        prev: Helpers.slide_path(Endpoint, :show, "39"),
        next: Helpers.slide_path(Endpoint, :show, "41")
      },
      "/slides/41" => %{
        prev: Helpers.slide_path(Endpoint, :show, "40"),
        next: Helpers.slide_path(Endpoint, :show, "42")
      },
      "/slides/42" => %{
        prev: Helpers.slide_path(Endpoint, :show, "41"),
        next: Helpers.slide_path(Endpoint, :show, "43")
      },
      "/slides/43" => %{
        prev: Helpers.slide_path(Endpoint, :show, "42"),
        next: Helpers.slide_path(Endpoint, :show, "44")
      },
      "/slides/44" => %{
        prev: Helpers.slide_path(Endpoint, :show, "43"),
        next: Helpers.slide_path(Endpoint, :show, "45")
      },
      "/slides/45" => %{
        prev: Helpers.slide_path(Endpoint, :show, "44"),
        next: Helpers.slide_path(Endpoint, :show, "46")
      },
      "/slides/46" => %{
        prev: Helpers.slide_path(Endpoint, :show, "45"),
        next: Helpers.slide_path(Endpoint, :show, "47")
      },
      "/slides/47" => %{
        prev: Helpers.slide_path(Endpoint, :show, "46"),
        next: Helpers.bankers_queue_path(Endpoint, :index)
      },
      "/bankers_queue" => %{
        prev: Helpers.slide_path(Endpoint, :show, "47"),
        next: Helpers.slide_path(Endpoint, :show, "48")
      },
      "/slides/48" => %{
        prev: Helpers.slide_path(Endpoint, :show, "39")
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
