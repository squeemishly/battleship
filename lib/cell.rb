require 'pry'

class Cell
  attr_reader :status

  def initialize
    @status = "empty"
  end

  def free?
    status == "empty"
  end
end

# binding.pry
# ""
