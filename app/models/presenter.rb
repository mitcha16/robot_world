require_relative 'robot_directory'

class Presenter

  def average_age
    robots = RobotDirectory.all
    if robots.size > 0
      return robots.reduce(0) do |total, robot|
        total += (Time.new.year - robot.birthday.year)
      end/(robots.size)
    else
      return 0
    end
  end

  def group_by_year
    robots = RobotDirectory.all
    return robots.group_by do |robot|
      robot.hired
    end
  end


  def group_by_department
    robots = RobotDirectory.all
    return robots.group_by do |robot|
      robot.department
    end
  end

  def group_by_city
    robots = RobotDirectory.all
    return robots.group_by do |robot|
      robot.city
    end
  end

end
