require './lib/ocean'
require 'pry'

class ComputerBoard
  attr_reader :ocean

  def initialize
    @ocean = Ocean.new
  end

  def place_ship
    
  end
end

board = ComputerBoard.new

binding.pry
""
