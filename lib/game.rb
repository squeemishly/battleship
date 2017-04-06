require './lib/player_board'
require './lib/computer_board'

class Game
  attr_reader :player_board,
              :computer_board

  def initialize
    @player_board = PlayerBoard.new
    @computer_board = ComputerBoard.new
  end
end
