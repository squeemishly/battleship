require './lib/cell'
require 'pry'

class Ocean
  attr_reader :gameboard,
              :size

  def initialize(size = 4)
    @gameboard = []
    @size = size
  end

  def add_column_headers
    letter = "A"
    gameboard.unshift([])
    size.times do
      gameboard[0] << letter
      letter = letter.next
    end
    gameboard
  end

  def make_grid
    size.times do
      gameboard << []
    end
    gameboard
  end

  def cellify
    gameboard.each do |arr|
      if arr == []
        size.times do
          arr << Cell.new
        end
      else
        next
      end
    end
  end

  def neighbors(cell1, cell2)
  
  end

end

# ocean = Ocean.new
# ocean.add_headers
# ocean.make_grid
# ocean.cellify
#
#
# binding.pry
# ""
