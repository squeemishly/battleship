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

  def test_can_generate_random_start
    assert_instance_of Array, @board.random_start
    assert_equal 2, @board.random_start.length
  end

  def test_it_can_determine_a_direction_to_place_the_ship
    @board.random_start
    direction = ["N", "E", "S", "W"]
    assert direction.include?(@board.determine_direction)
  end

  def test_find_a_random_adjacent_cell
    @board.random_start
    @board.adjacent_cell
    assert_instance_of Array, @board.ship_range
    assert_equal 1, @board.ship_range.length
  end

  def test_it_can_find_two_adjacent_cells
    @board.random_start
    @board.adjacent_cell(3)
    assert_instance_of Array, @board.ship_range
    assert_equal 2, @board.ship_range.length
  end

  def test_it_can_merge_starting_cell_and_adjacent_cells
    @board.random_start
    @board.adjacent_cell
    assert_instance_of Array, @board.create_ship
    assert_equal 2, @board.create_ship.length
  end

  def test_it_can_make_a_3_peg_boat
    @board.random_start
    @board.adjacent_cell(3)
    assert_instance_of Array, @board.create_ship
    assert_equal 3, @board.create_ship.length
  end

  def test_it_can_validate_that_all_cells_are_on_the_board
    @board.random_start
    @board.adjacent_cell(3)
    @board.create_ship
    assert_equal "", @board.validate_cells
  end

  # def test_it_knows_which_adjacent_cells_are_valid
  #   adjacent_cell = @board.adjacent_cell(2, "A1")
  #   assert_equal [[65, 1], [65, 2], [66, 1], [66, 2]], @board.validate_options(adjacent_cell)
  # end
  #
  # def test_it_removes_values_that_match_the_starting_cell
  #   # skip
  #   adjacent_cell = @board.adjacent_cell(2, "A1")
  #   validate = @board.validate_options(adjacent_cell)
  #   assert_equal [[65, 2], [66, 1], [66, 2]], @board.remove_starting_cell(validate, "A1")
  #   assert_equal [[65, 2], [66, 1], [66, 2]], @board.remove_starting_cell([[65, 1], [65, 2], [66, 1], [66, 2]], "A1")
  # end
  #
  # def test_it_picks_a_random_cell_from_the_valid_cells
  #   adjacent_cell = @board.adjacent_cell(2, "A1")
  #   validate = @board.validate_options(adjacent_cell)
  #   @board.remove_starting_cell(validate, "A1")
  #   assert_equal 2, @board.pick_adjacent_cell.length
  #   assert_instance_of Array, @board.pick_adjacent_cell
  # end
  #
  #
  # def test_it_merges_the_cells_to_valid_addresses
  #   skip
  #   @board.remove_starting_cell(@board.validate_options(@board.adjacent_cell("A1")), "A1")
  #   assert_equal 2, @board.merged_adjacent_cell.length
  #   assert_instance_of String, @board.merged_adjacent_cell
  # end
  #
  # def test_it_can_automate_ship_placement
  # end

end
