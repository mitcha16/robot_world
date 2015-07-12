class RobotDirectory

  def self.database
    if ENV['ROBOT_WORLD_ENV'] == 'test'
      @database ||= Sequel.sqlite("db/robot_directory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_directory_development.sqlite3")
    end
  end

  def self.create(robot)
    begin
      data_set.insert({
        "name" => robot[:name],
        "city" => robot[:city],
        "state" => robot[:state],
        "avatar" => robot[:avatar],
        "birthday" => robot[:birthday],
        "hired" => robot[:hired],
        "department" => robot[:department]})
      rescue
        return false
      end
      Robot.new(data_set.to_a.last)
    end

    def self.all
      data_set.to_a.map {|data| Robot.new(data)}
    end

    def self.find(id)
      Robot.new(data_set.where(:id => id).first)
    end

    def self.update(id, robot)
      data_set.where(:id => id).update(robot)
    end

    def self.delete(id)
      data_set.where(:id => id).delete
    end

    def self.delete_all
      data_set.delete
    end

    def self.data_set
      database.from(:robots)
    end


  end
