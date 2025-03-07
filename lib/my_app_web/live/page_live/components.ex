defmodule MyAppWeb.PageLive.Components do
  use MyAppWeb, :html

  attr :view_size, :atom, values: ~w(eq md sm fixed)a, required: true
  attr :view_mode, :atom, values: ~w(left split right)a, required: true
  attr :on_expand_left, JS
  attr :on_expand_right, JS

  slot :left, required: true
  slot :right, required: true

  def animated_split_view(assigns) do
    ~H"""
    <div class="flex-1 overflow-hidden">
      <div
        id="split_view_container"
        class={[
          "data-[size=eq]:[--right-width:50%]",
          "data-[size=md]:[--right-width:40%]",
          "data-[size=sm]:[--right-width:30%]",
          "data-[size=fixed]:[--right-width:--spacing(80)]",
          "[--left-width:calc(100%-var(--right-width))]",
          "[--view-padding:--spacing(8)]",
          "h-full flex relative isolate",
          "ease-out duration-200 transition-all",
          "group w-[100%] ml-[0%]",
          "lg:data-[mode=left]:w-[calc(100%+var(--right-width)-var(--view-padding))]",
          "lg:data-[mode=right]:w-[calc(100%+var(--left-width)-var(--view-padding))]",
          "lg:data-[mode=right]:ml-[calc(0%-var(--left-width)+var(--view-padding))]"
        ]}
        data-size={@view_size}
        data-mode={@view_mode}
      >
        <div class={[
          "h-full relative",
          "ease-out duration-200 transition-all",
          "hidden group-data-[mode=left]:block group-data-[mode=split]:block lg:block",
          "lg:w-[var(--left-width)]",
          "lg:group-data-[mode=left]:w-[calc(100%-var(--view-padding))]"
        ]}>
          <.inner_view_container>
            {render_slot(@left)}
          </.inner_view_container>
          <div class="hidden lg:block z-10 absolute inset-y-0 right-0 border-l border-zinc-100 space-y-4">
            <div class="absolute top-6 left-0 -ml-3 space-y-2">
              <.expand_view_button
                icon="hero-chevron-left-mini"
                phx-click={@on_expand_right}
                disabled={@on_expand_right == nil}
              />
              <.expand_view_button
                icon="hero-chevron-right-mini"
                phx-click={@on_expand_left}
                disabled={@on_expand_left == nil}
              />
            </div>
          </div>
        </div>
        <div class={[
          "h-full relative",
          "ease-out duration-200 transition-all",
          "hidden group-data-[mode=right]:block lg:block",
          "lg:w-[var(--right-width)]",
          "lg:group-data-[mode=right]:w-[calc(100%-var(--view-padding))]"
        ]}>
          <.inner_view_container>
            {render_slot(@right)}
          </.inner_view_container>
        </div>
      </div>
    </div>
    """
  end

  slot :inner_block

  def inner_view_container(assigns) do
    ~H"""
    <div class="mx-auto max-w-4xl p-4 sm:p-6 md:px-8 text-sm text-zinc-700">
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :icon, :string, required: true
  attr :rest, :global, include: ~w(disabled phx-click)

  def expand_view_button(assigns) do
    ~H"""
    <button
      class={[
        "h-8 w-6 flex items-center justify-center border rounded",
        "bg-zinc-100 text-zinc-700 disabled:text-zinc-400 border-zinc-200"
      ]}
      {@rest}
    >
      <.icon name={@icon} class="size-4" />
    </button>
    """
  end

  slot :inner_content

  def main(assigns) do
    ~H"""
    <main class="flex-1 flex flex-col">
      {render_slot(@inner_block)}
    </main>
    """
  end

  slot :inner_content

  def main_in_window(assigns) do
    ~H"""
    <main class={[
      "w-[900px] h-[600px] mx-auto my-32",
      "flex rotate-10",
      "border border-zinc-100 rounded-lg overflow-hidden"
    ]}>
      {render_slot(@inner_block)}
    </main>
    """
  end

  ## JS

  def set_view_size_js(size) do
    JS.push("update_view_size", value: %{size: size})
  end

  @doc """
  Switches view modes for `animated_split_view`, eagerly updating the view on
  the client while also pushing the updated state to the LiveView.
  """
  def set_view_mode_js(nil), do: nil

  def set_view_mode_js(mode) do
    %JS{}
    |> JS.push("update_view_mode", value: %{mode: mode})
    |> JS.set_attribute({"data-mode", mode}, to: "#split_view_container")
  end
end
