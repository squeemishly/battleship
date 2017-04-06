require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @new_game = Game.new
  end
  def test_it_exists
    assert_instance_of Game, @new_game
  end

  def test_it_has_access_to_the_player_board
    assert_instance_of PlayerBoard, @new_game.player_board
  end

  def test_it_has_access_to_the_computer_board
    assert_instance_of ComputerBoard, @new_game.computer_board
  end
end
