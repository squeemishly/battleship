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

  def test_it_prompts_players_to_place_double_ship
    assert_equal "Type in 2 cell addresses", @new_game.player_initial_prompt
  end

  def test_it_can_get_the_player_response
    assert_instance_of String, @new_game.grab_cell_addresses
  end

  def test_it_can_create_a_computer_board
    
  end
end
