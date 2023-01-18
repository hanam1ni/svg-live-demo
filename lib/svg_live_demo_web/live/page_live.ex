defmodule SvgLiveDemoWeb.PageLive do
  use SvgLiveDemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  def handle_event("increase", _, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end

  def handle_event("decrease", _, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter - 1)}
  end
end
