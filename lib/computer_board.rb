require './lib/ocean'
require 'pry'

class ComputerBoard
  attr_reader :ocean

  def initialize
    @ocean = Ocean.new
    ocean.startup
  end

  def random_start
    num = (1..ocean.size).to_a.sample.to_s
    char = (65..(65+ocean.size)).to_a.sample.chr
    result = num  + char
  end

  def adjacent_cell(starting_cell = random_start)
    val = starting_cell[0].ord
    num = starting_cell[1].to_i
    range_val = (val - 1..val + 1).to_a
    range_val.map! do |val|
      val.chr
    end
    range_num = (num -1..num+1).to_a
    full_range = range_val.product(range_num)
    binding.pry
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
