defmodule MyAppWeb.ClipboardCopyLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto my-16 max-w-4xl">
      <div id="copy_target" class="space-y-8">
        <p class="font-light tracking-tight">
          <i>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a quam sodales, blandit tellus quis, pulvinar urna. Sed rhoncus semper tincidunt. Aliquam erat volutpat. Nam pellentesque justo nec commodo blandit. Vivamus sed blandit lorem. Proin nec laoreet nisi, vel vulputate ipsum. Proin imperdiet quis nulla at maximus. Cras malesuada sapien vel urna eleifend vulputate.
          </i>
        </p>
        <p class="font-bold tracking-widest">
          <b>
            Aenean commodo bibendum turpis sed eleifend. Aliquam laoreet nisl sit amet tristique tincidunt. Suspendisse a diam id turpis efficitur vehicula. Etiam pretium elit id accumsan pellentesque. Proin quis pretium massa, vel congue arcu. Nunc laoreet gravida viverra. Pellentesque placerat iaculis tristique. Donec eu sagittis nibh, condimentum rutrum ex.
          </b>
        </p>
      </div>

      <div class="mt-8">
        <.button class="group" phx-click={JS.dispatch("phx:copy", detail: %{id: "copy_target"})}>
          <span class="flex items-center gap-2 group-data-copied:hidden">
            <.icon name="hero-clipboard-document" class="size-4" /> Copy
          </span>
          <span class="hidden items-center gap-2 group-data-copied:flex">
            <.icon name="hero-clipboard-document-check" class="size-4" /> Copied!
          </span>
        </.button>
      </div>
    </div>
    """
  end
end
