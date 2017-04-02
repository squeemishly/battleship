require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cell'

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new
    assert_instance_of Cell, cell
  end

  def test_it_has_no_ship_by_default
    cell = Cell.new
    refute cell.ship
  end
end
