require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ocean'

class OceanTest < Minitest::Test
  def test_it_exists
    ocean = Ocean.new
    assert_instance_of Ocean, ocean
  end

  def test_it_makes_a_grid
    ocean = Ocean.new
    assert_equal [[], [], [], []], ocean.make_grid
  end

  def test_the_grid_is_made_up_of_cells
    ocean = Ocean.new
    ocean.make_grid
    ocean.cellify
    assert_instance_of Cell, ocean.gameboard[1][0]
    assert_instance_of Cell, ocean.gameboard[1][1]
    assert_instance_of Cell, ocean.gameboard[1][2]
    assert_instance_of Cell, ocean.gameboard[1][3]
  end
end
