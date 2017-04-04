require './lib/ocean'
require 'pry'

class ComputerBoard
  attr_reader :ocean

  def initialize
    @ocean = Ocean.new
    ocean.startup
  end

  def place_2_piece_ship(cell1, cell2)
    if validate_ship_placement(cell1, cell2)
      ocean.find_cell(cell1).status = "ship"
      ocean.find_cell(cell2).status = "ship"
    end
  end

  def validate_ship_placement(cell1, cell2)
    ocean.neighbors(ocean.find_cell(cell1), ocean.find_cell(cell2))
  end

end

board = ComputerBoard.new

# binding.pry
# ""
