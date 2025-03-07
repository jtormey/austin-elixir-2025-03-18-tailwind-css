defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view

  import MyAppWeb.PageLive.Components

  def render(assigns) do
    ~H"""
    <.top_nav>
      <.icon name="hero-magnifying-glass" class="size-4 text-zinc-500" />
      <.button phx-click={set_view_size_js(:eq)}>Equal</.button>
      <.button phx-click={set_view_size_js(:md)}>Medium</.button>
      <.button phx-click={set_view_size_js(:sm)}>Small</.button>
      <.button phx-click={set_view_size_js(:fixed)}>Fixed</.button>
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
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </:left>
        <:right>
          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
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
      "fixed" -> :fixed
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
