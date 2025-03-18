defmodule MyAppWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use MyAppWeb, :html

  embed_templates "page_html/*"

  def svg_splash_graphic(assigns) do
    ~H"""
    <svg
      viewBox="0 0 1480 957"
      fill="none"
      aria-hidden="true"
      class="absolute inset-0 h-full w-full"
      preserveAspectRatio="xMinYMid slice"
    >
      <path fill="#EE7868" d="M0 0h1480v957H0z" />
      <path
        d="M137.542 466.27c-582.851-48.41-988.806-82.127-1608.412 658.2l67.39 810 3083.15-256.51L1535.94-49.622l-98.36 8.183C1269.29 281.468 734.115 515.799 146.47 467.012l-8.928-.742Z"
        fill="#FF9F92"
      />
      <path
        d="M371.028 528.664C-169.369 304.988-545.754 149.198-1361.45 665.565l-182.58 792.025 3014.73 694.98 389.42-1689.25-96.18-22.171C1505.28 697.438 924.153 757.586 379.305 532.09l-8.277-3.426Z"
        fill="#FA8372"
      />
      <path
        d="M359.326 571.714C-104.765 215.795-428.003-32.102-1349.55 255.554l-282.3 1224.596 3047.04 722.01 312.24-1354.467C1411.25 1028.3 834.355 935.995 366.435 577.166l-7.109-5.452Z"
        fill="#E96856"
        fill-opacity=".6"
      />
      <path
        d="M1593.87 1236.88c-352.15 92.63-885.498-145.85-1244.602-613.557l-5.455-7.105C-12.347 152.31-260.41-170.8-1225-131.458l-368.63 1599.048 3057.19 704.76 130.31-935.47Z"
        fill="#C42652"
        fill-opacity=".2"
      />
      <path
        d="M1411.91 1526.93c-363.79 15.71-834.312-330.6-1085.883-863.909l-3.822-8.102C72.704 125.95-101.074-242.476-1052.01-408.907l-699.85 1484.267 2837.75 1338.01 326.02-886.44Z"
        fill="#A41C42"
        fill-opacity=".2"
      />
      <path
        d="M1116.26 1863.69c-355.457-78.98-720.318-535.27-825.287-1115.521l-1.594-8.816C185.286 163.833 112.786-237.016-762.678-643.898L-1822.83 608.665 571.922 2635.55l544.338-771.86Z"
        fill="#A41C42"
        fill-opacity=".2"
      />
    </svg>
    """
  end

  def phoenix_marketing_details(assigns) do
    ~H"""
    <div class="mx-auto max-w-xl lg:mx-0">
      <svg viewBox="0 0 71 48" class="h-12" aria-hidden="true">
        <path
          d="m26.371 33.477-.552-.1c-3.92-.729-6.397-3.1-7.57-6.829-.733-2.324.597-4.035 3.035-4.148 1.995-.092 3.362 1.055 4.57 2.39 1.557 1.72 2.984 3.558 4.514 5.305 2.202 2.515 4.797 4.134 8.347 3.634 3.183-.448 5.958-1.725 8.371-3.828.363-.316.761-.592 1.144-.886l-.241-.284c-2.027.63-4.093.841-6.205.735-3.195-.16-6.24-.828-8.964-2.582-2.486-1.601-4.319-3.746-5.19-6.611-.704-2.315.736-3.934 3.135-3.6.948.133 1.746.56 2.463 1.165.583.493 1.143 1.015 1.738 1.493 2.8 2.25 6.712 2.375 10.265-.068-5.842-.026-9.817-3.24-13.308-7.313-1.366-1.594-2.7-3.216-4.095-4.785-2.698-3.036-5.692-5.71-9.79-6.623C12.8-.623 7.745.14 2.893 2.361 1.926 2.804.997 3.319 0 4.149c.494 0 .763.006 1.032 0 2.446-.064 4.28 1.023 5.602 3.024.962 1.457 1.415 3.104 1.761 4.798.513 2.515.247 5.078.544 7.605.761 6.494 4.08 11.026 10.26 13.346 2.267.852 4.591 1.135 7.172.555ZM10.751 3.852c-.976.246-1.756-.148-2.56-.962 1.377-.343 2.592-.476 3.897-.528-.107.848-.607 1.306-1.336 1.49Zm32.002 37.924c-.085-.626-.62-.901-1.04-1.228-1.857-1.446-4.03-1.958-6.333-2-1.375-.026-2.735-.128-4.031-.61-.595-.22-1.26-.505-1.244-1.272.015-.78.693-1 1.31-1.184.505-.15 1.026-.247 1.6-.382-1.46-.936-2.886-1.065-4.787-.3-2.993 1.202-5.943 1.06-8.926-.017-1.684-.608-3.179-1.563-4.735-2.408l-.043.03a2.96 2.96 0 0 0 .04-.029c-.038-.117-.107-.12-.197-.054l.122.107c1.29 2.115 3.034 3.817 5.004 5.271 3.793 2.8 7.936 4.471 12.784 3.73A66.714 66.714 0 0 1 37 40.877c1.98-.16 3.866.398 5.753.899Zm-9.14-30.345c-.105-.076-.206-.266-.42-.069 1.745 2.36 3.985 4.098 6.683 5.193 4.354 1.767 8.773 2.07 13.293.51 3.51-1.21 6.033-.028 7.343 3.38.19-3.955-2.137-6.837-5.843-7.401-2.084-.318-4.01.373-5.962.94-5.434 1.575-10.485.798-15.094-2.553Zm27.085 15.425c.708.059 1.416.123 2.124.185-1.6-1.405-3.55-1.517-5.523-1.404-3.003.17-5.167 1.903-7.14 3.972-1.739 1.824-3.31 3.87-5.903 4.604.043.078.054.117.066.117.35.005.699.021 1.047.005 3.768-.17 7.317-.965 10.14-3.7.89-.86 1.685-1.817 2.544-2.71.716-.746 1.584-1.159 2.645-1.07Zm-8.753-4.67c-2.812.246-5.254 1.409-7.548 2.943-1.766 1.18-3.654 1.738-5.776 1.37-.374-.066-.75-.114-1.124-.17l-.013.156c.135.07.265.151.405.207.354.14.702.308 1.07.395 4.083.971 7.992.474 11.516-1.803 2.221-1.435 4.521-1.707 7.013-1.336.252.038.503.083.756.107.234.022.479.255.795.003-2.179-1.574-4.526-2.096-7.094-1.872Zm-10.049-9.544c1.475.051 2.943-.142 4.486-1.059-.452.04-.643.04-.827.076-2.126.424-4.033-.04-5.733-1.383-.623-.493-1.257-.974-1.889-1.457-2.503-1.914-5.374-2.555-8.514-2.5.05.154.054.26.108.315 3.417 3.455 7.371 5.836 12.369 6.008Zm24.727 17.731c-2.114-2.097-4.952-2.367-7.578-.537 1.738.078 3.043.632 4.101 1.728.374.388.763.768 1.182 1.106 1.6 1.29 4.311 1.352 5.896.155-1.861-.726-1.861-.726-3.601-2.452Zm-21.058 16.06c-1.858-3.46-4.981-4.24-8.59-4.008a9.667 9.667 0 0 1 2.977 1.39c.84.586 1.547 1.311 2.243 2.055 1.38 1.473 3.534 2.376 4.962 2.07-.656-.412-1.238-.848-1.592-1.507Zm17.29-19.32c0-.023.001-.045.003-.068l-.006.006.006-.006-.036-.004.021.018.012.053Zm-20 14.744a7.61 7.61 0 0 0-.072-.041.127.127 0 0 0 .015.043c.005.008.038 0 .058-.002Zm-.072-.041-.008-.034-.008.01.008-.01-.022-.006.005.026.024.014Z"
          fill="#FD4F00"
        />
      </svg>
      <h1 class="text-brand mt-10 flex items-center text-sm font-semibold leading-6">
        Phoenix Framework
        <small class="bg-brand/5 text-[0.8125rem] ml-3 rounded-full px-2 font-medium leading-6">
          v{Application.spec(:phoenix, :vsn)}
        </small>
      </h1>
      <p class="text-[2rem] text-balance mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">
        Peace of mind from prototype to production.
      </p>
      <p class="mt-4 text-base leading-7 text-zinc-600">
        Build rich, interactive web applications quickly, with less code and fewer moving parts. Join our growing community of developers using Phoenix to craft APIs, HTML5 apps and more, for fun or at scale.
      </p>
      <div class="flex">
        <div class="w-full sm:w-auto">
          <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-4 sm:grid-cols-3">
            <a
              href="https://hexdocs.pm/phoenix/overview.html"
              class="group relative rounded-2xl px-6 py-4 text-sm font-semibold leading-6 text-zinc-900 sm:py-6"
            >
              <span class="absolute inset-0 rounded-2xl bg-zinc-50 transition group-hover:bg-zinc-100 sm:group-hover:scale-105">
              </span>
              <span class="relative flex items-center gap-4 sm:flex-col">
                <svg viewBox="0 0 24 24" fill="none" aria-hidden="true" class="h-6 w-6">
                  <path d="m12 4 10-2v18l-10 2V4Z" fill="#18181B" fill-opacity=".15" />
                  <path
                    d="M12 4 2 2v18l10 2m0-18v18m0-18 10-2v18l-10 2"
                    stroke="#18181B"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                </svg>
                Guides &amp; Docs
              </span>
            </a>
            <a
              href="https://github.com/phoenixframework/phoenix"
              class="group relative rounded-2xl px-6 py-4 text-sm font-semibold leading-6 text-zinc-900 sm:py-6"
            >
              <span class="absolute inset-0 rounded-2xl bg-zinc-50 transition group-hover:bg-zinc-100 sm:group-hover:scale-105">
              </span>
              <span class="relative flex items-center gap-4 sm:flex-col">
                <svg viewBox="0 0 24 24" aria-hidden="true" class="h-6 w-6">
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M12 0C5.37 0 0 5.506 0 12.303c0 5.445 3.435 10.043 8.205 11.674.6.107.825-.262.825-.585 0-.292-.015-1.261-.015-2.291C6 21.67 5.22 20.346 4.98 19.654c-.135-.354-.72-1.446-1.23-1.738-.42-.23-1.02-.8-.015-.815.945-.015 1.62.892 1.845 1.261 1.08 1.86 2.805 1.338 3.495 1.015.105-.8.42-1.338.765-1.645-2.67-.308-5.46-1.37-5.46-6.075 0-1.338.465-2.446 1.23-3.307-.12-.308-.54-1.569.12-3.26 0 0 1.005-.323 3.3 1.26.96-.276 1.98-.415 3-.415s2.04.139 3 .416c2.295-1.6 3.3-1.261 3.3-1.261.66 1.691.24 2.952.12 3.26.765.861 1.23 1.953 1.23 3.307 0 4.721-2.805 5.767-5.475 6.075.435.384.81 1.122.81 2.276 0 1.645-.015 2.968-.015 3.383 0 .323.225.707.825.585a12.047 12.047 0 0 0 5.919-4.489A12.536 12.536 0 0 0 24 12.304C24 5.505 18.63 0 12 0Z"
                    fill="#18181B"
                  />
                </svg>
                Source Code
              </span>
            </a>
            <a
              href={"https://github.com/phoenixframework/phoenix/blob/v#{Application.spec(:phoenix, :vsn)}/CHANGELOG.md"}
              class="group relative rounded-2xl px-6 py-4 text-sm font-semibold leading-6 text-zinc-900 sm:py-6"
            >
              <span class="absolute inset-0 rounded-2xl bg-zinc-50 transition group-hover:bg-zinc-100 sm:group-hover:scale-105">
              </span>
              <span class="relative flex items-center gap-4 sm:flex-col">
                <svg viewBox="0 0 24 24" fill="none" aria-hidden="true" class="h-6 w-6">
                  <path
                    d="M12 1v6M12 17v6"
                    stroke="#18181B"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                  <circle
                    cx="12"
                    cy="12"
                    r="4"
                    fill="#18181B"
                    fill-opacity=".15"
                    stroke="#18181B"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                </svg>
                Changelog
              </span>
            </a>
          </div>
          <div class="mt-10 grid grid-cols-1 gap-y-4 text-sm leading-6 text-zinc-700 sm:grid-cols-2">
            <div>
              <a
                href="https://twitter.com/elixirphoenix"
                class="group -mx-2 -my-0.5 inline-flex items-center gap-3 rounded-lg px-2 py-0.5 hover:bg-zinc-50 hover:text-zinc-900"
              >
                <svg
                  viewBox="0 0 16 16"
                  aria-hidden="true"
                  class="h-4 w-4 fill-zinc-400 group-hover:fill-zinc-600"
                >
                  <path d="M5.403 14c5.283 0 8.172-4.617 8.172-8.62 0-.131 0-.262-.008-.391A6.033 6.033 0 0 0 15 3.419a5.503 5.503 0 0 1-1.65.477 3.018 3.018 0 0 0 1.263-1.676 5.579 5.579 0 0 1-1.824.736 2.832 2.832 0 0 0-1.63-.916 2.746 2.746 0 0 0-1.821.319A2.973 2.973 0 0 0 8.076 3.78a3.185 3.185 0 0 0-.182 1.938 7.826 7.826 0 0 1-3.279-.918 8.253 8.253 0 0 1-2.64-2.247 3.176 3.176 0 0 0-.315 2.208 3.037 3.037 0 0 0 1.203 1.836A2.739 2.739 0 0 1 1.56 6.22v.038c0 .7.23 1.377.65 1.919.42.54 1.004.912 1.654 1.05-.423.122-.866.14-1.297.052.184.602.541 1.129 1.022 1.506a2.78 2.78 0 0 0 1.662.598 5.656 5.656 0 0 1-2.007 1.074A5.475 5.475 0 0 1 1 12.64a7.827 7.827 0 0 0 4.403 1.358" />
                </svg>
                Follow on Twitter
              </a>
            </div>
            <div>
              <a
                href="https://elixirforum.com"
                class="group -mx-2 -my-0.5 inline-flex items-center gap-3 rounded-lg px-2 py-0.5 hover:bg-zinc-50 hover:text-zinc-900"
              >
                <svg
                  viewBox="0 0 16 16"
                  aria-hidden="true"
                  class="h-4 w-4 fill-zinc-400 group-hover:fill-zinc-600"
                >
                  <path d="M8 13.833c3.866 0 7-2.873 7-6.416C15 3.873 11.866 1 8 1S1 3.873 1 7.417c0 1.081.292 2.1.808 2.995.606 1.05.806 2.399.086 3.375l-.208.283c-.285.386-.01.905.465.85.852-.098 2.048-.318 3.137-.81a3.717 3.717 0 0 1 1.91-.318c.263.027.53.041.802.041Z" />
                </svg>
                Discuss on the Elixir Forum
              </a>
            </div>
            <div>
              <a
                href="https://web.libera.chat/#elixir"
                class="group -mx-2 -my-0.5 inline-flex items-center gap-3 rounded-lg px-2 py-0.5 hover:bg-zinc-50 hover:text-zinc-900"
              >
                <svg
                  viewBox="0 0 16 16"
                  aria-hidden="true"
                  class="h-4 w-4 fill-zinc-400 group-hover:fill-zinc-600"
                >
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M6.356 2.007a.75.75 0 0 1 .637.849l-1.5 10.5a.75.75 0 1 1-1.485-.212l1.5-10.5a.75.75 0 0 1 .848-.637ZM11.356 2.008a.75.75 0 0 1 .637.848l-1.5 10.5a.75.75 0 0 1-1.485-.212l1.5-10.5a.75.75 0 0 1 .848-.636Z"
                  />
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M14 5.25a.75.75 0 0 1-.75.75h-9.5a.75.75 0 0 1 0-1.5h9.5a.75.75 0 0 1 .75.75ZM13 10.75a.75.75 0 0 1-.75.75h-9.5a.75.75 0 0 1 0-1.5h9.5a.75.75 0 0 1 .75.75Z"
                  />
                </svg>
                Chat on Libera IRC
              </a>
            </div>
            <div>
              <a
                href="https://discord.gg/elixir"
                class="group -mx-2 -my-0.5 inline-flex items-center gap-3 rounded-lg px-2 py-0.5 hover:bg-zinc-50 hover:text-zinc-900"
              >
                <svg
                  viewBox="0 0 16 16"
                  aria-hidden="true"
                  class="h-4 w-4 fill-zinc-400 group-hover:fill-zinc-600"
                >
                  <path d="M13.545 2.995c-1.02-.46-2.114-.8-3.257-.994a.05.05 0 0 0-.052.024c-.141.246-.297.567-.406.82a12.377 12.377 0 0 0-3.658 0 8.238 8.238 0 0 0-.412-.82.052.052 0 0 0-.052-.024 13.315 13.315 0 0 0-3.257.994.046.046 0 0 0-.021.018C.356 6.063-.213 9.036.066 11.973c.001.015.01.029.02.038a13.353 13.353 0 0 0 3.996 1.987.052.052 0 0 0 .056-.018c.308-.414.582-.85.818-1.309a.05.05 0 0 0-.028-.069 8.808 8.808 0 0 1-1.248-.585.05.05 0 0 1-.005-.084c.084-.062.168-.126.248-.191a.05.05 0 0 1 .051-.007c2.619 1.176 5.454 1.176 8.041 0a.05.05 0 0 1 .053.006c.08.065.164.13.248.192a.05.05 0 0 1-.004.084c-.399.23-.813.423-1.249.585a.05.05 0 0 0-.027.07c.24.457.514.893.817 1.307a.051.051 0 0 0 .056.019 13.31 13.31 0 0 0 4.001-1.987.05.05 0 0 0 .021-.037c.334-3.396-.559-6.345-2.365-8.96a.04.04 0 0 0-.021-.02Zm-8.198 7.19c-.789 0-1.438-.712-1.438-1.587 0-.874.637-1.586 1.438-1.586.807 0 1.45.718 1.438 1.586 0 .875-.637 1.587-1.438 1.587Zm5.316 0c-.788 0-1.438-.712-1.438-1.587 0-.874.637-1.586 1.438-1.586.807 0 1.45.718 1.438 1.586 0 .875-.63 1.587-1.438 1.587Z" />
                </svg>
                Join our Discord server
              </a>
            </div>
            <div>
              <a
                href="https://fly.io/docs/elixir/getting-started/"
                class="group -mx-2 -my-0.5 inline-flex items-center gap-3 rounded-lg px-2 py-0.5 hover:bg-zinc-50 hover:text-zinc-900"
              >
                <svg
                  viewBox="0 0 20 20"
                  aria-hidden="true"
                  class="h-4 w-4 fill-zinc-400 group-hover:fill-zinc-600"
                >
                  <path d="M1 12.5A4.5 4.5 0 005.5 17H15a4 4 0 001.866-7.539 3.504 3.504 0 00-4.504-4.272A4.5 4.5 0 004.06 8.235 4.502 4.502 0 001 12.5z" />
                </svg>
                Deploy your application
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
