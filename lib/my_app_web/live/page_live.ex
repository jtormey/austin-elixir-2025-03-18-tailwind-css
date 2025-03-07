defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <.top_nav />

    <main class="flex-1">
      PageLive
    </main>
    """
  end
end
