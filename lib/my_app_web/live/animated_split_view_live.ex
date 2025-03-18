defmodule MyAppWeb.AnimatedSplitViewLive do
  use MyAppWeb, :live_view

  import MyAppWeb.AnimatedSplitViewLive.Components

  def render(assigns) do
    ~H"""
    <.top_nav>
      <.icon name="hero-magnifying-glass" class="size-4 text-zinc-500" />
      <.button phx-click={set_view_size_js(:eq)}>Equal</.button>
      <.button phx-click={set_view_size_js(:md)}>Medium</.button>
      <.button phx-click={set_view_size_js(:sm)}>Small</.button>
      <.icon name="hero-view-columns" class="size-4 text-zinc-500" />
      <.button phx-click={set_view_mode_js(:left)}>Left</.button>
      <.button phx-click={set_view_mode_js(:split)} class="hidden lg:block">Split</.button>
      <.button phx-click={set_view_mode_js(:right)}>Right</.button>
    </.top_nav>

    <.main>
      <.animated_split_view
        view_size={@view_size}
        view_mode={@view_mode}
        on_expand_left={set_view_mode_js(view_mode_expand_to(@view_mode, :left))}
        on_expand_right={set_view_mode_js(view_mode_expand_to(@view_mode, :right))}
      >
        <:left>
          <.inner_view_container>
            <MyAppWeb.PageHTML.phoenix_marketing_details />
          </.inner_view_container>
        </:left>
        <:right>
          <MyAppWeb.PageHTML.svg_splash_graphic />
        </:right>
      </.animated_split_view>
    </.main>
    """
  end

  def handle_params(params, _session, socket) do
    {:noreply,
     socket
     |> assign(:view_size, size_from_param(params["size"]))
     |> assign(:view_mode, mode_from_param(params["mode"]))}
  end

  def handle_event("update_view_size", %{"size" => size}, socket) do
    {:noreply, assign(socket, :view_size, size_from_param(size))}
  end

  def handle_event("update_view_mode", %{"mode" => mode}, socket) do
    {:noreply, assign(socket, :view_mode, mode_from_param(mode))}
  end

  ## Helpers

  def size_from_param(size) do
    case size do
      "md" -> :md
      "sm" -> :sm
      _otherwise -> :eq
    end
  end

  def mode_from_param(mode) do
    case mode do
      "left" -> :left
      "right" -> :right
      _otherwise -> :split
    end
  end

  def view_mode_expand_to(current, direction) do
    case {current, direction} do
      {mode, mode} -> nil
      {:split, mode} -> mode
      _otherwise -> :split
    end
  end
end
