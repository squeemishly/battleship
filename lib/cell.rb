require 'pry'

class Cell
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

binding.pry
""
