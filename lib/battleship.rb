require 'pry'

class Battleship

  def initialize
    puts welcome
    desire
  end

  def welcome
    "Welcome to Battleship®"
  end

  def desire
    puts "Do you wanna (p)lay, read the (i)nstructions, or (q)uit?"
    answer = gets.chomp.downcase
    if answer == "p" || "play"
      ###
    elsif answer == "i" || "instructions"
      puts instructions
      desire
    elsif answer == "q" || "quit"
      exit
    else
      puts "That is not a valid response"
      desire
    end
  end

  def instructions
    "Blow up the enemy before you get blown up yourself."
  end

end

new_game = Battleship.new
new_game.welcome
# new_game.desire
# binding.pry
# ""


# puts "Would you like to (p)lay, read the (i)nstrutions, or (q)uit?"
# answer = gets.chomp
