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

  # def test_it_can_validate_ship_placement
  #   assert @board.validate_ship_placement("A1", "A2")
  #   refute @board.validate_ship_placement("A1", "B3")
  # end

  # def test_it_can_place_a_2_piece_ship
  #   assert_equal "ship", @board.place_2_piece_ship("A1", "A2")
  #   refute @board.place_2_piece_ship("A1", "B3")
  # end

  def test_can_generate_random_start
    # skip
    assert_instance_of String, @board.random_start
    assert_equal 2, @board.random_start.length
  end

  def test_find_a_random_adjacent_cell
    assert_equal [[64, 1], [66, 1], [65, 0], [65, 2]], @board.adjacent_cell("A1")
  end

  def test_it_knows_which_adjacent_cells_are_valid
    adjacent_cell = @board.adjacent_cell("A1")
    assert_equal [[66, 1], [65, 2]], @board.validate_options(adjacent_cell)
  end

  # def test_it_removes_values_that_match_the_starting_cell
  #   # skip
  #   adjacent_cell = @board.adjacent_cell("A1")
  #   validate = @board.validate_options(adjacent_cell)
  #   assert_equal [[65, 2], [66, 1], [66, 2]], @board.remove_starting_cell(validate, "A1")
  #   assert_equal [[65, 2], [66, 1], [66, 2]], @board.remove_starting_cell([[65, 1], [65, 2], [66, 1], [66, 2]], "A1")
  # end

  def test_it_picks_a_random_cell_from_the_valid_cells
    adjacent_cell = @board.adjacent_cell("A1")
    validate = @board.validate_options(adjacent_cell)
    # @board.remove_starting_cell(validate, "A1")
    assert_equal 2, @board.pick_adjacent_cell.length
    assert_instance_of Array, @board.pick_adjacent_cell
  end


  def test_it_merges_the_cells_to_valid_addresses
    # skip
    adjacent_cell = @board.adjacent_cell("A1")
    validate = @board.validate_options(adjacent_cell)
    assert_equal 2, @board.merged_adjacent_cell.length
    assert_instance_of String, @board.merged_adjacent_cell
  end

  def test_it_can_automate_ship_placement
  end

end
