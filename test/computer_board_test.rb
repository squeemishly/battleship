require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/computer_board'

class ComputerBoardTest < Minitest::Test
  def setup
    @board = ComputerBoard.new
  end

  def test_it_exists
    assert_instance_of ComputerBoard, @board
  end

  def test_it_access_the_ocean
    assert_instance_of Ocean, @board.ocean
  end

  def test_it_can_place_a_single_ship
    assert_equal "ship", @board.place_ship
  end

  def test_it_can_find_a_cell_in_the_ocean
    
  end
end
