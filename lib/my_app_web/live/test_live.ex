defmodule MyAppWeb.TestLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex h-full items-center justify-center">
      <div class={["", "bg-red-500/50 rounded p-1"]}>
        [Test]
      </div>
    </div>
    """
  end
end
