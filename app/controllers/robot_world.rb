require 'models/robot_directory'
require 'models/presenter'

class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get "/" do
    @presenter = Presenter.new
    erb :dashboard
  end

  get "/robots" do
    @robots = RobotDirectory.all
    erb :index
  end

  get "/robots/new" do
    erb :new
  end


  post "/robots" do
    RobotDirectory.create(params[:robot])
    redirect "/robots"
  end

  get "/robots/:id" do |id|
    @robot = RobotDirectory.find(id.to_i)
    erb :robot
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotDirectory.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotDirectory.update(id.to_i, params[:robot])
    redirect "robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotDirectory.delete(id.to_i)
    redirect '/robots'
  end

  not_found do
    erb :error
  end
end
