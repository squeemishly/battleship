require './lib/ocean'
require 'pry'

class ComputerBoard
  attr_reader :ocean,
              :starting_cell
  attr_accessor :valid_range

  def initialize
    @ocean = Ocean.new
    ocean.startup
    @starting_cell = random_start
    @valid_range = []
  end

############ move the finding cells to it's own class? maybe just validating in its own class?

  def random_start
    num = (1..@ocean.size).to_a.sample.to_s
    char = (65..(65 + @ocean.size)).to_a.sample.chr
    result = char  + num
  end

  def convert_to_letters(range)
    range.map! do |val|
      val.chr
    end
  end

  def adjacent_cell(start = starting_cell)
    char = start[0].ord
    num = start[1].to_i
    range_char = (char - 1..char + 1).to_a
    range_num = (num - 1..num + 1).to_a
    full_range = range_char.product(range_num)
  end

  def validate_options(range = adjacent_cell)
    @valid_range = range.find_all do |vals|
      vals[0] >= 65 && vals[1] >= 1 ### add in that it can't be starting cell
    end
    @valid_range
  end

  def remove_starting_cell(range = @valid_range, start = starting_cell)
    start = start.chars
    start = [start[0].ord, start[1].to_i]
    final_range = range.reject do |vals|
      vals == start
    end
    final_range
  end

  # def place_2_piece_ship(cell1, cell2)
  #   if validate_ship_placement(cell1, cell2)
  #     ocean.find_cell(cell1).status = "ship"
  #     ocean.find_cell(cell2).status = "ship"
  #   end
  # end

  # def validate_ship_placement(cell1, cell2)
  #   ocean.neighbors(ocean.find_cell(cell1), ocean.find_cell(cell2))
  # end

end

board = ComputerBoard.new

# binding.pry
# ""
