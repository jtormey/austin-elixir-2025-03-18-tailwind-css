defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view

  import MyAppWeb.PageLive.Components

  def render(assigns) do
    ~H"""
    <.top_nav>
      <.link patch={~p"/?mode=left"}>Left</.link>
      <.link patch={~p"/"}>Split</.link>
      <.link patch={~p"/?mode=right"}>Right</.link>
      <.button phx-click={set_view_mode_js(:left)}>Left</.button>
      <.button phx-click={set_view_mode_js(:split)}>Split</.button>
      <.button phx-click={set_view_mode_js(:right)}>Right</.button>
    </.top_nav>

    <main class="flex-1 flex flex-col">
      <.animated_split_view
        view_mode={@view_mode}
        on_expand_left={set_view_mode_js(view_mode_expand_to(:left, @view_mode))}
        on_expand_right={set_view_mode_js(view_mode_expand_to(:right, @view_mode))}
      >
        <:left>
          Left
        </:left>
        <:right>
          Right
        </:right>
      </.animated_split_view>
    </main>
    """
  end

  def handle_params(params, _session, socket) do
    {:noreply, assign(socket, :view_mode, mode_from_param(params["mode"]))}
  end

  def handle_event("update_view_mode", %{"mode" => mode}, socket) do
    {:noreply, assign(socket, :view_mode, mode_from_param(mode))}
  end

  ## Private

  def mode_from_param(mode) do
    case mode do
      "left" -> :left
      "right" -> :right
      _otherwise -> :split
    end
  end

  def view_mode_expand_to(direction, current) do
    case {direction, current} do
      {mode, mode} -> nil
      {mode, :split} -> mode
      _otherwise -> :split
    end
  end
end
