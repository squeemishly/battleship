require 'pry'

class Battleship

  def initialize
    puts welcome
  end
  
  def welcome
    "Welcome to Battleship®"
  end

  def desire
    puts "Do you wanna (p)lay, read the (i)nstructions, or (q)uit?"
    answer = gets.chomp
  end

  def quitter

  end

end

new_game = Battleship.new
new_game.welcome
new_game.desire
puts "q"
binding.pry
""


# puts "Would you like to (p)lay, read the (i)nstrutions, or (q)uit?"
# answer = gets.chomp
