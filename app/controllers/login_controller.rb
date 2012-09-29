require 'haml'
require_relative '../../app/models/trade/user'
class LoginController < Sinatra::Application
  post "/login" do
    #login duh!?

    fail "user or password empty!" if params[:username].nil? or params[:password].nil?
    user =  User.by_name params[:username]
    fail "user or password incorrect" if user.nil? or user.name != params[:password]
    session[:name] = user.name
    redirect '/'
  end

  get "/login" do
    #show login form
    haml :login
  end

  get "/logout" do
    #destroy session
    session[:name] = nil
    haml :logout
  end
end