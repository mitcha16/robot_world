require_relative '../test_helper'

class RobotDirectoryTest < Minitest::Test

  def test_it_creates_a_robot
    RobotDirectory.create({:name => "a name",
      :city => "a city",
      :state => "a state",
      :avatar => "an avatar",
      :department => "a department",
      :birthday => "a birthday",
      :hired => "hired"})
      robot = RobotDirectory.all.to_a.last
      assert_equal "a name", robot.name
      assert_equal "a department", robot.department
    end

    def test_it_can_find_all_robots
      3.times do
        RobotDirectory.create({:name => "a name",
          :city => "a city",
          :state => "a state",
          :avatar => "an avatar",
          :department => "a department",
          :birthday => "a birthday",
          :hired => "hired"})
        end
        assert_equal 3, RobotDirectory.all.size
      end

      def test_it_can_find_a_robot
        RobotDirectory.create({:name => "a name",
          :city => "a city",
          :state => "a state",
          :avatar => "an avatar",
          :department => "a department",
          :birthday => "a birthday",
          :hired => "hired"})
          RobotDirectory.create({:name => "two",
            :city => "a city",
            :state => "a state",
            :avatar => "an avatar",
            :department => "a department",
            :birthday => "a birthday",
            :hired => "hired"})
            assert_equal "two", RobotDirectory.find(RobotDirectory.all.to_a.last.id).name
          end

          def test_it_can_update_a_robot
            3.times do
              RobotDirectory.create({:name => "a name",
                :city => "a city",
                :state => "a state",
                :avatar => "an avatar",
                :department => "a department",
                :birthday => "a birthday",
                :hired => "hired"})
              end
              new_robot = ({:name => "a new name",
                :city => "a city",
                :state => "a state",
                :avatar => "an avatar",
                :department => "a department",
                :birthday => "a birthday",
                :hired => "hired"})
                RobotDirectory.update(RobotDirectory.all.to_a.last.id, new_robot)
                assert_equal "a new name", RobotDirectory.find(RobotDirectory.all.to_a.last.id).name
              end

              def test_it_can_destroy_a_robot
                RobotDirectory.create({:name => "a name",
                  :city => "a city",
                  :state => "a state",
                  :avatar => "an avatar",
                  :department => "a department",
                  :birthday => "a birthday",
                  :hired => "hired"})
                  RobotDirectory.create({:name => "a new name",
                    :city => "a city",
                    :state => "a state",
                    :avatar => "an avatar",
                    :department => "a department",
                    :birthday => "a birthday",
                    :hired => "hired"})
                    RobotDirectory.delete(RobotDirectory.all.to_a.last.id)
                    assert_equal 1, RobotDirectory.all.size
                  end

                  def test_it_can_destroy_all_robots
                    3.times do
                      RobotDirectory.create({:name => "a name",
                        :city => "a city",
                        :state => "a state",
                        :avatar => "an avatar",
                        :department => "a department",
                        :birthday => "a birthday",
                        :hired => "hired"})
                      end
                      RobotDirectory.delete_all
                      assert_equal 0, RobotDirectory.all.size
                    end

                  end
