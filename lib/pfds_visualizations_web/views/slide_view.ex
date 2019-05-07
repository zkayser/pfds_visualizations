defmodule PfdsVisualizationsWeb.SlideView do
  use PfdsVisualizationsWeb, :view
  alias PfdsVisualizationsWeb, as: App

  def slide_for(id) do
    case id do
      "1" ->
        "intro.html"

      "2" ->
        "definition.html"

      "3" ->
        "persistence.html"

      "4" ->
        "questioning_persistence.html"

      "5" ->
        "sharing.html"

      "6" ->
        "sharing_example.html"

      "7" ->
        "sharing_example_2.html"

      "8" ->
        "sharing_example_3.html"

      "9" ->
        "sharing_example_4.html"

      "10" ->
        "sharing_example_5.html"

      "11" ->
        "complex_sharing.html"

      "12" ->
        "binary_tree_sharing.html"

      "13" ->
        "lazy_vs_strict.html"

      "14" ->
        "strict_eval_elixir.html"

      "15" ->
        "strict_mod.html"

      "16" ->
        "strict_eval_elixir_2.html"

      "17" ->
        "simple_lazy_elixir.html"

      "18" ->
        "lazy_mod.html"

      "19" ->
        "simple_lazy_elixir_2.html"

      "20" ->
        "eval_strategies.html"

      "21" ->
        "why_memoization.html"

      "22" ->
        "elixir_call_by_need.html"

      "23" ->
        "suspension.html"

      "24" ->
        "suspension_downside.html"

      "25" ->
        "deflazy.html"

      "26" ->
        "deflazy_in_action.html"

      "27" ->
        "incremental_vs_monolithic.html"

      "28" ->
        "incremental_vs_monolithic_2.html"

      "29" ->
        "amortization_fundamentals.html"

      "30" ->
        "traditional_amortization.html"

      "31" ->
        "methods_of_amortization.html"

      "32" ->
        "bankers_method.html"

      "33" ->
        "bankers_method_rigorous.html"

      "34" ->
        "batched_queue_api.html"

      "35" ->
        "batched_queue_invariants.html"

      "36" ->
        "batched_queue_operations.html"

      "37" ->
        "traditional_analysis_downside.html"

      "38" ->
        "downside_continued.html"

      "39" ->
        "reconciling_persistence.html"

      "40" ->
        "persistent_amortized_analysis.html"

      "41" ->
        "shared_cost_breakdown.html"

      "42" ->
        "persistent_amortized_cost.html"

      # "3" -> "refresher.html"
      _ ->
        "intro.html"
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
      "10" -> [:reveal_1]
      "11" -> [:reveal_1]
      "12" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4, :reveal_5, :reveal_6, :reveal_7]
      "13" -> [:reveal_1, :reveal_2]
      "16" -> [:reveal_1, :reveal_2]
      "19" -> [:reveal_1]
      "20" -> [:reveal_1, :reveal_2, :reveal_3]
      "21" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4, :reveal_5]
      "22" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4]
      "24" -> [:reveal_1]
      "25" -> [:reveal_1]
      "27" -> [:reveal_1, :reveal_2]
      "29" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4]
      "30" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4, :reveal_5]
      "31" -> [:reveal_1]
      "32" -> [:reveal_1, :reveal_2]
      "33" -> [:reveal_1, :reveal_2, :reveal_3]
      "35" -> [:reveal_1, :reveal_2, :reveal_3]
      "36" -> [:reveal_1, :reveal_2, :reveal_3]
      "37" -> [:reveal_1, :reveal_2, :reveal_3]
      "38" -> [:reveal_1, :reveal_2]
      "39" -> [:reveal_1, :reveal_2, :reveal_3]
      "40" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4]
      "41" -> [:reveal_1, :reveal_2]
      "42" -> [:reveal_1, :reveal_2, :reveal_3, :reveal_4, :reveal_5]
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
