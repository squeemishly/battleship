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

  def test_it_can_validate_ship_placement
    assert @board.validate_ship_placement("A1", "A2")
    refute @board.validate_ship_placement("A1", "B3")
  end

  def test_it_can_place_a_2_piece_ship
    assert_equal "ship", @board.place_2_piece_ship("A1", "A2")
    refute @board.place_2_piece_ship("A1", "B3")
  end

  def test_can_generate_random_start
    assert_instance_of String, @board.random_start
    assert_equal 2, @board.random_start.length
  end

  def test_find_a_random_adjacent_cell
    assert_equal 9, @board.adjacent_cell("A1").length
  end

  

  def test_it_can_automate_ship_placement
  end

end
