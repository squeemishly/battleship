require './lib/player_board'
require './lib/computer_board'

class Game
  attr_reader :player_board,
              :computer_board

  def initialize
    @player_board = PlayerBoard.new
    @computer_board = ComputerBoard.new
  end

  def player_initial_prompt
    p "The computer's boats have been placed."
    p "It's time to determine where your fleet is situated"
    p "Let's start with a 2 piece boat."
    "Type in 2 cell addresses"
  end

  def grab_cell_addresses
    puts player_initial_prompt
    answer = gets.chomp
  end

  def play_game
    player_initial_prompt
    grab_cell_addresses
  end
end

game = Game.new
puts game.player_initial_prompt
