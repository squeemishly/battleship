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

  def test_it_can_place_a_2_piece_ship
    @board.place_ship("A1", "A2")
    assert_equal "ship", @board.ocean.gameboard[1][0].status
    assert_equal "ship", @board.ocean.gameboard[1][1].status

    @board.place_ship("B1", "C1")
    assert_equal "ship", @board.ocean.gameboard[2][0].status
    assert_equal "ship", @board.ocean.gameboard[3][0].status

    @board.place_ship("A3", "B4")
    assert_equal "empty", @board.ocean.gameboard[1][2].status
    assert_equal "empty", @board.ocean.gameboard[2][3].status

    assert_equal "Yo, dummy, that ain't no proper ship placement", @board.place_ship("D4", "A4")
    assert_equal "You already have a ship there. Please try again.", @board.place_ship("C1", "C2")
  end

  def test_it_can_place_a_3_piece_ship
    @board.place_ship("A1", "A2", "A3")
    assert_equal "ship", @board.ocean.gameboard[1][0].status
    assert_equal "ship", @board.ocean.gameboard[1][1].status
    assert_equal "ship", @board.ocean.gameboard[1][2].status

    @board.place_ship("B1", "C1", "D1")
    assert_equal "ship", @board.ocean.gameboard[2][0].status
    assert_equal "ship", @board.ocean.gameboard[3][0].status
    assert_equal "ship", @board.ocean.gameboard[4][0].status

    assert_equal "Yo, dummy, that ain't no proper ship placement", @board.place_ship("A4", "B3", "C2")
    assert_equal "empty", @board.ocean.gameboard[1][3].status
    assert_equal "empty", @board.ocean.gameboard[2][2].status
    assert_equal "empty", @board.ocean.gameboard[3][1].status

    assert_equal "You already have a ship there. Please try again.", @board.place_ship("A2", "B2", "C2")
    assert_equal "ship", @board.ocean.gameboard[1][1].status
    assert_equal "empty", @board.ocean.gameboard[2][1].status
    assert_equal "empty", @board.ocean.gameboard[3][1].status
  end

end
