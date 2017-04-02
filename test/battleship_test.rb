require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_it_exists
    new_game = Battleship.new
    assert_instance_of Battleship, new_game
  end

  def test_it_welcomes_the_new_player
    new_game = Battleship.new
    assert_equal "Welcome to Battleship®", new_game.welcome
  end

  def test_it_asks_what_they_want_to_do
    new_game = Battleship.new
    options = ["p", "i", "q"]
    assert options.include?(new_game.desire)
  end

  def test_it_gives_instructions
    new_game = Battleship.new
    new_game.welcome
    new_game.desire
    assert_equal "Blow up the enemy before you get blown up yourself.", puts "i"
  end

  def test_if_quits_if_they_select_q
    new_game = Battleship.new
    new_game.welcome
    new_game.desire
    assert_equal exit, puts "q"
  end
end
