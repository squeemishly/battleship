require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ocean'

class OceanTest < Minitest::Test
  def test_it_exists
    ocean = Ocean.new
    assert_instance_of Ocean, ocean
  end
end
