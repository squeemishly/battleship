require './lib/ocean'
require 'pry'

class ComputerBoard
  attr_reader :ocean,
              # :starting_cell,
              :valid_range,
              :ship_range

  def initialize
    @ocean = Ocean.new
    ocean.startup
    # @starting_cell = random_start
    @ship_range = []
    @char = nil
    @num = nil
  end

############ move the finding cells to it's own class? maybe just validating in its own class?

  def random_start
    @num = (1..@ocean.size).to_a.sample
    @char = (65..(64 + @ocean.size)).to_a.sample
    result = [@char, @num]
  end

  def determine_direction
    if @char == 65
      direction = ["E", "S", "W"].sample
    elsif @num == 1
      direction = ["N", "E", "S"].sample
    elsif @char == (64 + ocean.size)
      direction = ["N", "E", "W"].sample
    elsif @num == ocean.size
      direction = ["N", "E", "S"].sample
    else
      direction = ["N", "E", "S", "W"].sample
    end
    direction
  end

  def adjacent_cell(shipsize = 2)
    direction = determine_direction
    shipsize -=1
    while shipsize > 0
      if direction == "N"
        ship_range << [(@char - shipsize), @num]
      elsif direction == "E"
        ship_range << [@char, (@num + shipsize)]
      elsif direction == "S"
        ship_range << [(@char + shipsize), @num]
      elsif direction == "W"
        ship_range << [@char, (@num - shipsize)]
      end
      shipsize -= 1
    end
    ship_range
  end



  # def validate_options(range = adjacent_cell)
  #   @valid_range = range.find_all do |vals|
  #     vals[0] >= 65 && vals[1] >= 1
  #   end
  #   @valid_range
  # end
  #
  # def pick_adjacent_cell
  #   valid_range.sample
  # end

  # def merged_adjacent_cell
  #   pick_adjacent_cell[0] = pick_adjacent_cell[0].chr
  #   value = pick_adjacent_cell.join('')
  # end

end

board = ComputerBoard.new
# board.adjacent_cell


# binding.pry
# ""
