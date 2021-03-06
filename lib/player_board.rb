require './lib/ocean'
require './lib/cell'
require 'pry'

class PlayerBoard
  attr_reader :ocean

  def initialize
    @ocean = Ocean.new
    ocean.startup
  end

  def place_ship(cell1, cell2, cell3 = nil, cell4 = nil, cell5 = nil)
    starter = [cell1, cell2, cell3, cell4, cell5]
    clean_start = no_nils(starter)
    convert_to_cells(clean_start)
    if clean_start.all? { |peg| peg.free?}
      clean_start.each_with_index do |peg, index|
        if clean_start[index + 1] == nil
          next
        else
          if ocean.neighbors(clean_start[index], clean_start[index + 1])
            clean_start[index].status = "ship"
            clean_start[index + 1].status = "ship"
          else
            return "Yo, dummy, that ain't no proper ship placement"
          end
        end
      end
    else
      return "You already have a ship there. Please try again."
    end
  end

  ### these are helper methods for place_ship. should be private?
  def no_nils(cells)
    cells.find_all do |cell|
      cell != nil
    end
  end

  def convert_to_cells(cell_names)
    cell_names.map! do |cell|
      ocean.find_cell(cell)
    end
  end

end

board = PlayerBoard.new
