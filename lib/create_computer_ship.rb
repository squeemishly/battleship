require './lib/ocean'
require 'pry'

class CreateComputerShip
  def initialize(ship_size)
    @ship_size = ship_size
    @ocean = Ocean.new
    @ocean.startup
    @ship_range = []
    @ship = nil
  end

  def random_start
    @num = (1..@ocean.size).to_a.sample
    @char = (65..(64 + @ocean.size)).to_a.sample
    result = [@char, @num]
  end

  def determine_direction
    ["N", "E", "S", "W"].sample
  end

  def adjacent_cell
    direction = determine_direction
    shipsize = @ship_size
    shipsize -=1
    while shipsize > 0
      if direction == "N"
        @ship_range << [(@char - shipsize), @num]
      elsif direction == "E"
        @ship_range << [@char, (@num + shipsize)]
      elsif direction == "S"
        @ship_range << [(@char + shipsize), @num]
      elsif direction == "W"
        @ship_range << [@char, (@num - shipsize)]
      end
      shipsize -= 1
    end
    @ship_range
  end

  def create_ship
    @ship = [[[@char, @num]], @ship_range].flatten(1)
  end

  def validate_cells
    @ship.each do |peg|
      if peg[0] < 65 || peg[0] > (64 + @ocean.size) || peg[1] < 1 || peg[1] > @ocean.size
        @ship_range = []
        @ship = nil
        adjacent_cell
        create_ship
      end
    end
    @ship
  end

  def convert_to_cells
    @ship.map! do |cell|
      character = cell[0].chr
      number = cell[1].to_s
      character + number
    end
  end

  def add_ship
    random_start
    adjacent_cell
    create_ship
    validate_cells
    convert_to_cells
  end
end
