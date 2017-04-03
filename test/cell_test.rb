require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_no_ship_by_default
    assert_equal "empty", @cell.status
  end

  def test_can_tell_it_there_is_a_ship_in_it
    assert @cell.free?
  end

  def test_it_starts_without_a_name
    assert_equal "", @cell.name
  end
end
