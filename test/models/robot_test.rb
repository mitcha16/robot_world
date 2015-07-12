require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({:name => "a name",
      :city => "a city",
      :state => "a state",
      :avatar => "an avatar",
      :department => "a department",
      :birthday => "a birthday",
      :hired => "hired"})
    assert_equal "a name", robot.name
  end
end
