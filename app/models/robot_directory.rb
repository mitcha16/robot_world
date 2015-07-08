require 'yaml/store'
require_relative 'robot'

class RobotDirectory

  def self.database
    @database ||= YAML::Store.new("db/robo_directory")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'],
        "name" => robot[:name],
        "city" => robot[:city],
        "state" => robot[:state],
        "avatar" => robot[:avatar],
        "birthday" => robot[:birthday],
        "hired" => robot[:hired],
        "department" => robot[:department]}
      end
    end

    def self.all
      raw_robots.map { |data| Robot.new(data) }
    end

    def self.raw_robots
      database.transaction do
        database['robots'] || []
      end
    end

    def self.raw_robot(id)
      raw_robots.find { |robot| robot["id"] == id }
    end

    def self.find(id)
      Robot.new(raw_robot(id))
    end


    def self.update(id, robot)
      database.transaction do
        target = database['robots'].find { |data| data["id"] == id }
        target["name"] = robot[:name]
        target["city"] = robot[:city]
        target["state"] = robot[:state]
        target["avatar"] = robot[:avatar]
        target["birthday"] = robot[:birthday]
        target["hired"] = robot[:hired]
        target["department"] = robot[:department]
      end
    end

    def self.delete(id)
      database.transaction do
        database['robots'].delete_if { |robot| robot["id"] == id }
      end
    end


  end
