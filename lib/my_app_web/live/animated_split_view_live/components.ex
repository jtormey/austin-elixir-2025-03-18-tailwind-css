defmodule MyAppWeb.AnimatedSplitViewLive.Components do
  use MyAppWeb, :html

  attr :view_size, :atom, values: ~w(eq md sm)a, required: true
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
          "data-[size=md]:[--right-width:35%]",
          "data-[size=sm]:[--right-width:20%]",
          "[--left-width:calc(100%-var(--right-width))]",
          "[--outside-offset:--spacing(8)]",
          "relative isolate flex h-full w-full",
          "transition-all duration-200 ease-out",
          "group/animated-split-view",
          "lg:data-[mode=right]:ml-[calc(0%-var(--left-width)+var(--outside-offset))]"
        ]}
        data-size={@view_size}
        data-mode={@view_mode}
      >
        <div class={[
          "relative h-full w-full",
          "transition-all duration-200 ease-out",
          "hidden lg:block",
          "group-data-[mode=left]/animated-split-view:block",
          "group-data-[mode=split]/animated-split-view:block",
          "lg:w-[var(--left-width)]",
          "lg:group-data-[mode=left]/animated-split-view:w-[calc(100%-var(--outside-offset))]"
        ]}>
          {render_slot(@left)}
          <div class="absolute inset-y-0 right-0 z-10 hidden space-y-4 border-l border-zinc-100 lg:block">
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
          "h-full w-full lg:right-[0%] lg:absolute",
          "transition-all duration-200 ease-out",
          "hidden lg:block",
          "group-data-[mode=right]/animated-split-view:block",
          "lg:w-[var(--right-width)]",
          "lg:group-data-[mode=left]/animated-split-view:right-[calc(var(--outside-offset)-var(--right-width))]",
          "lg:group-data-[mode=right]/animated-split-view:w-[calc(100%-var(--outside-offset))]",
          "lg:group-data-[mode=right]/animated-split-view:right-[calc(var(--outside-offset)-var(--left-width))]"
        ]}>
          {render_slot(@right)}
        </div>
      </div>
    </div>
    """
  end

  slot :inner_block

  def inner_view_container(assigns) do
    ~H"""
    <div class="mx-auto max-w-4xl p-4 text-sm text-zinc-700 sm:p-6 md:px-8">
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
        "flex h-8 w-6 items-center justify-center rounded border",
        "border-zinc-200 bg-zinc-100 text-zinc-700 disabled:text-zinc-400"
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
    <main class="flex flex-1 flex-col">
      {render_slot(@inner_block)}
    </main>
    """
  end

  slot :inner_content

  def main_in_window(assigns) do
    ~H"""
    <main class={[
      "w-[900px] h-[600px] mx-auto my-32",
      "rotate-10 flex",
      "overflow-hidden rounded-lg border border-zinc-100"
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
