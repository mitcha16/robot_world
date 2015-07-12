require 'sequel'
require 'sqlite3'
require './app/models/robot_directory'
environments = %w(test development)
environments.each do |environment|
  Sequel.sqlite("db/robot_directory_#{environment}.sqlite3").create_table :robots do
    primary_key :id
    String      :name
    String      :city
    String      :state
    String      :avatar
    String      :birthday
    String      :hired
    String      :department
  end
end
