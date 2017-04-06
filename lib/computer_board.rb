require './lib/ocean'
require 'pry'

class ComputerBoard
  attr_reader :ocean,
              :starting_cell,
              :valid_range

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

  def adjacent_cell(start = starting_cell)
    char = start[0].ord
    num = start[1].to_i
    arr = []
    arr << [(char - 1), num]
    arr << [(char + 1), num]
    arr << [char, (num - 1)]
    arr << [char, (num + 1)]
    arr
  end

  def validate_options(range = adjacent_cell)
    @valid_range = range.find_all do |vals|
      vals[0] >= 65 && vals[1] >= 1
    end
    @valid_range
  end

  def pick_adjacent_cell
    valid_range.sample
  end

  def merged_adjacent_cell
    pick_adjacent_cell[0] = pick_adjacent_cell[0].chr
    value = pick_adjacent_cell.join('')
  end

end

board = ComputerBoard.new
board.adjacent_cell


# binding.pry
# ""
