require 'pry'

class Cell
  attr_reader :status
  attr_accessor :name

  def initialize
    @status = "empty"
    @name = ""
  end

  def free?
    status == "empty"
  end
end

# binding.pry
# ""
