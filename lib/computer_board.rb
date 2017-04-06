require './lib/ocean'
require './lib/create_computer_ship'
require 'pry'

class ComputerBoard
  attr_reader :ocean,
              :valid_range,
              :ship_range,
              :ship

  def initialize(ship_size = 2)
    @ocean = Ocean.new
    ocean.startup
    @ship = CreateComputerShip.new(ship_size)
  end

  def place_ship
    shippy = @ship.add_ship
    shippy.each do |shipper|
      ship_cell = ocean.find_cell(shipper)
      ship_cell.status = "ship"
    end
    ocean.find_cell(shippy[0]).status
  end

end

board = ComputerBoard.new
