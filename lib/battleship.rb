require './lib/game'
require 'pry'

class Battleship

  def initialize
    puts welcome
    desire
    @game = Game.new
  end

  def welcome
    "Welcome to Battleship®"
  end

  def desire
    puts "Do you wanna (p)lay, read the (i)nstructions, or (q)uit?"
    answer = gets.chomp.downcase
    if answer == "p" || answer == "play"
      @game
    elsif answer == "i" || answer == "instructions"
      instructions
      desire
    elsif answer == "q" || answer == "quit"
      exit
    else
      puts "That is not a valid response"
      desire
    end
  end

  def instructions
    puts "Blow up the enemy before you get blown up yourself."
    puts "Press Enter to return to the home screen"
    gets
  end

end

new_game = Battleship.new
