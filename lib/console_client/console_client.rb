require 'game/game'
require 'game/game_engine'
require 'game/player'

module ConsoleClient
  class ConsoleClient
    CONTINUE = false
    EXIT = true

    def initialize(io, text_provider, ui)
      @io = io
      @text_provider = text_provider
      @ui = ui
    end

    def start
      begin
        quit = display_main_menu
      end until quit
      @io.display(@text_provider::QUIT)
      @io.exit
    end

    private

    def display_main_menu
      @io.clear_screen
      @io.display(@text_provider::TITLE)
      @io.display(@text_provider::HELP)
      @io.display(@text_provider::MAIN_MENU)
      case @io.get_input(['1', '2', 'quit'], @text_provider::INVALID_SELECTION)
      when '1'
        play_game
      else
        EXIT
      end
    end

    def play_game
      player_one = configure_player(1, 'X', 'Player 1')
      player_two = configure_player(2, 'O', 'Player 2') unless player_one == EXIT
      quit = player_one == EXIT || player_two == EXIT
      unless quit
        engine = Game::GameEngine.new(@ui)
        engine.start(player_one, player_two)
        quit = display_return_to_main_menu
      end
      quit
    end

    def configure_player(player, token, name)
      @io.clear_screen
      @io.display(@text_provider::PLAYER_TYPE)
      case @io.get_input(['1', '2', '3', 'quit'], @text_provider::INVALID_SELECTION)
      when '1'
        Game::Player.create(:human, token, name)
      when '2'
        Game::Player.create(:easy, token, name)
      when '3'
        Game::Player.create(:hard, token, name)
      else
        EXIT
      end
    end

    def display_return_to_main_menu
      @io.display(@text_provider::RETURN_TO_MAIN_MENU)
      continue = @io.get_input(['y', 'n', 'quit'], @text_provider::INVALID_SELECTION)
      continue == 'y' ? CONTINUE : EXIT
    end
  end
end
