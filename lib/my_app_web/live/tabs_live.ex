defmodule MyAppWeb.TabsLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="w-[400px] mx-auto my-16">
      <div class="mb-8">
        Selected tab: {String.upcase(@tab)}
      </div>

      <div id="tab_container" data-tab="a" class="group/tabs">
        <div class="mb-8">
          <.button phx-click={select_tab("a")}>
            Tab A
          </.button>
          <.button phx-click={select_tab("b")}>
            Tab B
          </.button>
          <.button phx-click={select_tab("c")}>
            Tab C
          </.button>
        </div>

        <div class="hidden group-data-[tab=a]/tabs:block">
          Tab A content
        </div>
        <div class="hidden group-data-[tab=b]/tabs:block">
          Tab B content
        </div>
        <div class="hidden group-data-[tab=c]/tabs:block">
          Tab C content
        </div>
      </div>
    </div>
    """
  end

  def select_tab(tab) do
    %JS{}
    |> JS.push("select_tab", value: %{tab: tab})
    |> JS.set_attribute({"data-tab", tab}, to: "#tab_container")
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :tab, "a")}
  end

  def handle_event("select_tab", %{"tab" => tab}, socket) do
    {:noreply,
     socket
     |> assign(:tab, tab)
     |> put_flash(:info, "Selected tab #{String.upcase(tab)}!")}
  end
end
