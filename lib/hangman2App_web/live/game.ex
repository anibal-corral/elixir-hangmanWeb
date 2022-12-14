defmodule Hangman2AppWeb.Live.Game do
  use Hangman2AppWeb, :live_view
  def mount(_paams, _session, socket) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    socket = socket |> assign(%{ game: game, tally: tally })
    { :ok, socket }
  end
  def handle_event("make_move", %{ "key" => key }, socket) do

    tally = Hangman.make_move(socket.assigns.game, key)
    { :noreply, assign(socket, :tally, tally)}
  end
  def render(assigns) do
    ~L"""
    <div class="game-holder" phx-window-keyup="make_move">
    <%= live_component(__MODULE__.Figure,    tally: assigns.tally, id: 1 )%>
    <%= live_component(__MODULE__.Alphabet,    tally: assigns.tally, id: 2 )%>
    <%= live_component(__MODULE__.WordSoFar,    tally: assigns.tally, id: 3 )%>
    </div>
    """
  end

end
