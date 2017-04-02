require './lib/cell'
require 'pry'

class Ocean
  attr_reader :gameboard,
              :size

  def initialize(size = 4)
    @gameboard = []
    @size = size
  end

  def make_grid
    a = []
    b = []
    c = []
    d = []
    gameboard.push(a,b,c,d)
  end

  def cellify
    gameboard.each do |arr|
      size.times do
        arr << Cell.new
      end
    end
  end


end
