require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/computer_board'

class ComputerBoardTest < Minitest::Test
  def test_it_exists
    board = ComputerBoard.new
    assert_instance_of ComputerBoard, board
  end

  def test_it_access_the_ocean
    board = ComputerBoard.new
    assert_instance_of Ocean, board.ocean
  end

  def test_it_can_add_a_double_ship
    board = ComputerBoard.new
    assert_equal "ship", board.place_ship
  end

  def test_it_can_add_a_triple_ship
    board = ComputerBoard.new(3)
    assert_equal "ship", board.place_ship
  end

end
