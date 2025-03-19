defmodule MyAppWeb.ViewTransitionLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div
      id={"card-#{@index}"}
      class="right-[50%] translate-x-[50%] absolute max-w-4xl"
      phx-mounted={card_mounted_js()}
      phx-remove={card_remove_js()}
    >
      <div class="mx-8 my-32 rounded-xl bg-orange-100 px-8 py-4 shadow-xl">
        <.header>
          {@card.title}
        </.header>
        <p class="underline-offset-6 mt-4 text-sm italic leading-7 text-zinc-600 underline">
          {@card.body}
        </p>
        <div class="mt-8 grid grid-cols-3 border-b-4 border-dotted border-orange-200">
          <div class="flex justify-start">
            <div class="size-6 inset-shadow-sm mb-2 rounded-full border border-orange-200 bg-white" />
          </div>
          <div class="flex justify-center">
            <div class="size-6 inset-shadow-sm mb-2 rounded-full border border-orange-200 bg-white" />
          </div>
          <div class="flex justify-end">
            <div class="size-6 inset-shadow-sm mb-2 rounded-full border border-orange-200 bg-white" />
          </div>
        </div>
      </div>
    </div>

    <div class="left-[50%] translate-x-[-50%] absolute bottom-32">
      <.button
        phx-click={@prev_path && card_switch_js(@prev_path, :prev)}
        disabled={@prev_path == nil}
      >
        Prev
      </.button>
      <.button
        phx-click={@next_path && card_switch_js(@next_path, :next)}
        disabled={@next_path == nil}
      >
        Next
      </.button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :cards, cards())}
  end

  def handle_params(%{"index" => index}, _uri, socket) do
    index = String.to_integer(index)
    max_index = length(socket.assigns.cards) - 1

    prev_index = if index > 0, do: index - 1
    next_index = if index < max_index, do: index + 1

    {:noreply,
     socket
     |> assign(:index, index)
     |> assign(:card, Enum.at(socket.assigns.cards, index))
     |> assign(:prev_path, prev_index && ~p"/example/view-transition?index=#{prev_index}")
     |> assign(:next_path, next_index && ~p"/example/view-transition?index=#{next_index}")}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, redirect(socket, to: ~p"/example/view-transition?index=0")}
  end

  ## JS

  def card_switch_js(to, dir) when dir in [:prev, :next] do
    JS.patch(to)
    |> JS.add_class("card-change card-#{dir}", to: "body")
  end

  def card_mounted_js() do
    JS.transition(
      {
        "transition-all duration-300 ease-out",
        "group-[.card-change]/page-transition:opacity-0 " <>
          "group-[.card-prev]/page-transition:-rotate-15 " <>
          "group-[.card-prev]/page-transition:translate-x-[-100%] " <>
          "group-[.card-next]/page-transition:rotate-15 " <>
          "group-[.card-next]/page-transition:translate-x-[100%]",
        "opacity-100 rotate-0 translate-x-[0%]"
      },
      time: 300
    )
    |> JS.remove_class("card-change card-prev card-next", to: "body", transition: "_", time: 300)
  end

  def card_remove_js() do
    JS.hide(
      transition: {
        "transition-all duration-300 ease-out",
        "opacity-100 rotate-0 translate-x-[0%]",
        "group-[.card-change]/page-transition:opacity-0 " <>
          "group-[.card-prev]/page-transition:rotate-15 " <>
          "group-[.card-prev]/page-transition:translate-x-[100%] " <>
          "group-[.card-next]/page-transition:-rotate-15 " <>
          "group-[.card-next]/page-transition:translate-x-[-100%]"
      },
      time: 300
    )
  end

  ## Private

  def cards() do
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a quam sodales, blandit tellus quis, pulvinar urna. Sed rhoncus semper tincidunt. Aliquam erat volutpat. Nam pellentesque justo nec commodo blandit. Vivamus sed blandit lorem. Proin nec laoreet nisi, vel vulputate ipsum. Proin imperdiet quis nulla at maximus. Cras malesuada sapien vel urna eleifend vulputate.
    Aenean commodo bibendum turpis sed eleifend. Aliquam laoreet nisl sit amet tristique tincidunt. Suspendisse a diam id turpis efficitur vehicula. Etiam pretium elit id accumsan pellentesque. Proin quis pretium massa, vel congue arcu. Nunc laoreet gravida viverra. Pellentesque placerat iaculis tristique. Donec eu sagittis nibh, condimentum rutrum ex.
    Suspendisse et enim at lectus varius lobortis nec eu purus. Duis sed elementum nunc. Nam ultrices erat nunc, eu semper odio tincidunt convallis. Donec sed imperdiet diam, placerat ornare libero. Praesent rhoncus in purus sit amet tempor. Sed accumsan efficitur ornare. Etiam eu elementum dui. Sed tempus lacus auctor, commodo lacus quis, tempor leo. Curabitur orci metus, fringilla eu mattis non, viverra sit amet lacus. Etiam nisl lacus, porta non pretium porta, rhoncus a sapien. Curabitur scelerisque fringilla orci vitae ultrices. Aliquam faucibus accumsan vestibulum. Proin lacinia nulla vel augue vehicula, nec scelerisque felis semper. Vestibulum sodales, nunc eu tempus viverra, turpis nibh euismod lectus, vitae pellentesque dolor tellus ac purus. Maecenas luctus lorem libero, non viverra mauris hendrerit ut. Integer consectetur ligula est, eget ultricies lacus sollicitudin sit amet.
    Integer porttitor metus ante. Morbi ac semper dui. Etiam finibus, lectus id varius eleifend, orci arcu fermentum lacus, id tempor nulla nunc vitae orci. Aenean eu mattis erat. Aliquam in vulputate augue. Vivamus condimentum purus nibh, non tempor urna ultricies eu. Proin est libero, porttitor vel mattis nec, aliquet ac mi. Donec sollicitudin consequat purus, lacinia fringilla leo sollicitudin ac. Aliquam iaculis quis turpis id egestas. Vivamus eu eros eget mauris hendrerit auctor id eget odio. Suspendisse auctor tortor sollicitudin tellus fermentum consectetur. Nulla dignissim hendrerit consequat. Etiam quis gravida mi. Suspendisse porttitor, massa a eleifend dignissim, enim lorem imperdiet nulla, tempor bibendum dui risus sed nibh. Mauris facilisis erat a dolor mollis, quis tristique nisi hendrerit.
    Nulla pharetra a libero quis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In viverra ante vitae est euismod auctor. Donec elit lectus, pulvinar sagittis ipsum eu, dictum varius dolor. Donec imperdiet nec ex sit amet tincidunt. Sed hendrerit sapien urna, eget blandit lorem iaculis feugiat. Aliquam a eleifend ante, ut malesuada elit. In tellus risus, ultrices eu vestibulum ut, porttitor id mauris. Curabitur ac odio sed nunc consequat porta eget ac leo. Integer enim tortor, vulputate non sapien eget, semper aliquet ipsum. Aenean at vehicula augue.
    Cras arcu enim, tempor quis nisi sit amet, vehicula tempor lorem. Curabitur eu nibh ac urna mollis varius. Cras vestibulum, nisi id auctor interdum, erat risus fringilla ipsum, ut ullamcorper lacus dui et enim. Nulla facilisis tellus non viverra congue. Aenean at felis sed sem tristique tincidunt. Vivamus mollis justo in elit ornare, vel dignissim nulla varius. Nam lobortis a est ut pharetra. Ut tellus sem, malesuada consectetur dui ornare, tincidunt pretium velit. Proin et ornare nulla. Phasellus mattis nunc ac metus blandit, id viverra lorem fermentum. Praesent quam tortor, vulputate eget laoreet eget, consectetur eu mauris. Nunc eu tempus dui.
    Nullam volutpat enim nec tincidunt euismod. Sed faucibus iaculis dolor quis tincidunt. In et ligula justo. Sed nisl lorem, vestibulum vitae vehicula nec, malesuada vel mauris. Etiam luctus augue ut ante sagittis pharetra. Integer eleifend justo metus, nec consectetur arcu iaculis ac. Nulla facilisi. Aliquam a nisi in justo tristique lacinia a nec lectus. Fusce vulputate tempus iaculis. Praesent a sodales ex. Nulla eu accumsan purus. Praesent nec lacus fringilla, rhoncus tellus ac, facilisis libero.
    In vitae efficitur lorem. In nec orci vel ex sagittis malesuada. Phasellus vestibulum purus eget velit iaculis tempor. In venenatis arcu eu dui commodo volutpat. Pellentesque eget mollis purus. In nec velit blandit, scelerisque justo et, dictum nibh. Pellentesque feugiat aliquam felis. Donec vestibulum dictum sem. Duis sed lacinia purus. Mauris vulputate ex ut sollicitudin viverra. Etiam vel commodo orci. Nam scelerisque leo ante, eu scelerisque enim facilisis non. Aenean semper, ligula non auctor mollis, tellus neque pellentesque quam, vulputate faucibus sem dolor at ante.
    Maecenas varius ex quis lobortis egestas. Nam mi urna, fermentum ut imperdiet sit amet, faucibus ut nisi. Fusce dolor ligula, tempus ut nunc in, mattis dapibus massa. Mauris volutpat tempus porttitor. Integer convallis at nulla quis porta. Pellentesque nec nisi vitae lectus mattis mattis. In leo lorem, hendrerit non leo nec, tristique rhoncus nibh.
    Nullam iaculis luctus libero, et pellentesque nisi feugiat a. Curabitur turpis est, tristique vel fermentum ac, tempus quis massa. Nullam aliquam eleifend mauris, non ultrices nisl facilisis sed. Morbi posuere, orci a venenatis lacinia, velit massa tincidunt ipsum, vehicula pulvinar lorem eros eu elit. Duis ex turpis, ultricies sodales lacinia et, mollis quis purus. Sed non nunc quis metus tincidunt viverra ut et mauris. Donec condimentum quam felis, sit amet volutpat purus mollis eu. Vivamus dignissim lorem quis vestibulum porttitor. Nunc ultrices, diam at ornare consectetur, nunc arcu rhoncus magna, eu facilisis diam odio ut mi. Duis hendrerit porttitor felis vel laoreet. Nunc euismod vestibulum ornare. Vestibulum bibendum nunc id nunc tincidunt, at posuere sapien facilisis. In quis aliquet nisl. Sed vehicula metus a facilisis facilisis. Ut id tristique tellus. Vestibulum quis mi molestie, vehicula nisl at, ullamcorper tellus.
    """
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      {title, body} = Enum.split(String.split(line, " "), 3)
      %{title: Enum.join(title, " "), body: Enum.join(body, " ")}
    end)
  end
end
