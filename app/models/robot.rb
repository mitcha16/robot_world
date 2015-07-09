class Robot
  attr_reader :id, :name, :city, :state, :avatar, :birthday,
  :hired, :department

  def initialize(robot)
    @id = robot["id"]
    @name = robot["name"]
    @city = robot["city"]
    @state = robot["state"]
    @avatar = robot["avatar"]
    @birthday = check_date(robot["birthday"])
    @hired = check_date(robot["hired"])
    @department = robot["department"]
  end

  def check_date(date)
    begin
      date = Date.parse(date)
    rescue ArgumentError
      date = Date.parse(Time.new.to_s)
    end
  end


end
