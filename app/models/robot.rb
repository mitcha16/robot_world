class Robot
  attr_reader :id, :name, :city, :state, :avatar, :birthday,
              :hired, :department

  def initialize(robot)
    @id = robot["id"]
    @name = robot["name"]
    @city = robot["city"]
    @state = robot["state"]
    @avatar = robot["avatar"]
    @birthday = robot["birthday"]
    @hired = robot["hired"]
    @department = robot["department"]
  end

end
