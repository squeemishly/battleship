require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/create_computer_ship'

class CreateComputerShipTest < Minitest::Test
  def test_it_exists
    new_ship = CreateComputerShip.new(2)
    assert_instance_of CreateComputerShip, new_ship
  end

  def test_can_generate_random_start
    new_ship = CreateComputerShip.new(2)
    assert_instance_of Array, new_ship.random_start
    assert_equal 2, new_ship.random_start.length
  end

  def test_it_can_determine_a_direction_to_place_the_ship
    new_ship = CreateComputerShip.new(2)
    direction = ["N", "E", "S", "W"]
    assert direction.include?(new_ship.determine_direction)
  end

  def test_find_a_random_adjacent_cell
    new_ship = CreateComputerShip.new(2)
    new_ship.random_start
    assert_instance_of Array, new_ship.adjacent_cell
  end

  def test_it_can_find_two_adjacent_cells
    new_ship = CreateComputerShip.new(3)
    new_ship.random_start
    assert_instance_of Array, new_ship.adjacent_cell
  end

  def test_it_can_merge_starting_cell_and_adjacent_cells
    new_ship = CreateComputerShip.new(2)
    new_ship.random_start
    new_ship.adjacent_cell
    assert_instance_of Array, new_ship.create_ship
    assert_equal 2, new_ship.create_ship.length
  end

  def test_it_can_make_a_3_peg_boat
    new_ship = CreateComputerShip.new(3)
    new_ship.random_start
    new_ship.adjacent_cell
    assert_instance_of Array, new_ship.create_ship
    assert_equal 3, new_ship.create_ship.length
  end

  def test_it_can_validate_that_all_cells_are_on_the_board
    new_ship = CreateComputerShip.new(3)
    new_ship.random_start
    new_ship.adjacent_cell
    new_ship.create_ship
    assert_instance_of Array, new_ship.validate_cells
  end

  def test_it_converts_the_cells_back_to_addresses
    new_ship = CreateComputerShip.new(3)
    new_ship.random_start
    new_ship.adjacent_cell
    new_ship.create_ship
    new_ship.validate_cells
    assert_instance_of Array, new_ship.convert_to_cells
  end

end
