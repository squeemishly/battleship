require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/player_board'

class PlayerBoardTest < Minitest::Test
  def setup
    @board = PlayerBoard.new
  end

  def test_it_exists
    assert_instance_of PlayerBoard, @board
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
    assert_equal "ship", @board.place_2_piece_ship("B1", "C1")
    assert_equal "Yo, dummy, that ain't no proper ship placement", @board.place_2_piece_ship("A3", "B4")
    assert_equal "Yo, dummy, that ain't no proper ship placement", @board.place_2_piece_ship("D4", "A4")
    assert_equal "You already have a ship there. Please try again.", @board.place_2_piece_ship("C1", "C2")
  end

  def test_it_can_place_a_3_piece_ship
    skip
    assert_equal "ship", @board.place_3_piece_ship("A1", "A2", "A3")
    assert_equal "ship", @board.place_3_piece_ship("A1", "B1", "C1")
    assert_equal "Yo, dummy, that ain't no proper ship placement", @board.place_3_piece_ship("A4", "B3", "C2")
    refute @board.place_3_piece_ship("A2", "B2", "C2")
  end

end
