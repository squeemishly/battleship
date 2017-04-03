require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ocean'
require 'pry'

class OceanTest < Minitest::Test
  def setup
    @ocean = Ocean.new
  end

  def test_it_exists
    assert_instance_of Ocean, @ocean
  end

  def test_it_adds_column_headers
    assert_equal [["A", "B", "C", "D"]], @ocean.add_column_headers
  end

  def test_it_makes_a_grid
    assert_equal [[], [], [], []], @ocean.make_grid
  end

  def test_the_grid_is_made_up_of_cells
    @ocean.add_column_headers
    @ocean.make_grid
    @ocean.cellify
    assert_instance_of Cell, @ocean.gameboard[1][0]
    assert_instance_of Cell, @ocean.gameboard[1][1]
    assert_instance_of Cell, @ocean.gameboard[1][2]
    assert_instance_of Cell, @ocean.gameboard[1][3]
    assert_instance_of Cell, @ocean.gameboard[2][2]
    assert_instance_of Cell, @ocean.gameboard[3][3]
  end

  def test_cells_in_the_ocean_can_have_cell_addresses
    @ocean = Ocean.new
    @ocean.add_column_headers
    @ocean.make_grid
    @ocean.cellify
    @ocean.namify
    assert_equal "A1", @ocean.gameboard[1][0].name
    assert_equal "A2", @ocean.gameboard[1][1].name
    assert_equal "B3", @ocean.gameboard[2][2].name
  end

  def test_it_can_find_the_cell_given_the_cell_name
    @ocean.add_column_headers
    @ocean.make_grid
    @ocean.cellify
    @ocean.namify
    assert_equal @ocean.gameboard[1][0], @ocean.find_cell("A1")
  end

  def test_it_can_tell_which_cells_are_neighbors
    @ocean = Ocean.new
    @ocean.add_column_headers
    @ocean.make_grid
    @ocean.cellify
    @ocean.namify
    assert @ocean.neighbors(@ocean.gameboard[1][0], @ocean.gameboard[1][1])
    assert @ocean.neighbors(@ocean.gameboard[1][1], @ocean.gameboard[2][1])
    refute @ocean.neighbors(@ocean.gameboard[1][0], @ocean.gameboard[3][0])
    refute @ocean.neighbors(@ocean.gameboard[1][1], @ocean.gameboard[3][1])
  end

end
