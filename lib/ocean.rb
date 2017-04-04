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

  def namify
    row_letter = "A"
    gameboard.each do |arr|
      if arr[0] == "A"
        next
      else
        column_number = "1"
        arr.each do |cell|
          cell.name = row_letter + column_number
          column_number = column_number.next
        end
        row_letter = row_letter.next
      end
    end
  end

  def startup
    add_column_headers
    make_grid
    cellify
    namify
  end

  def find_cell(cell_name)
    gameboard.each do |cells|
      if cells[0] == "A"
        next
      else
        cells.each do |cell|
          if cell.name == cell_name
            return cell
            break
          end
        end
      end
    end
  end

  def neighbors(cell1, cell2)
    first = cell1.name.chars
    second = cell2.name.chars
    if first[0] == second[0] && (first[1] == second[1].next || first[1] == (second[1].ord - 1).chr)
      true
    elsif first[1] == second[1] && (first[0] == second[0].next || first[0] == (second[0].ord - 1).chr)
      true
    else
      false
    end
  end

end

ocean = Ocean.new
ocean.add_column_headers
ocean.make_grid
ocean.cellify
ocean.namify
ocean.find_cell("A1")
#
# binding.pry
# ""
