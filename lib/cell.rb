require 'pry'

class Cell
  attr_accessor :name,
                :status

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
