require 'haml'
require_relative '../../app/models/trade/user'
class LoginController < Sinatra::Application

  post "/login" do
    #login duh!?
    user =  User.by_name params[:username]
    if user.nil? or user.name != params[:password]
      haml :login, :locals => {:msg => "User or password incorrect!"}
    else
      session[:name] = user.name
      redirect '/'
    end
  end

  get "/login" do
    #show login form
    haml :login, :locals => {:msg => ""}
  end

  get "/logout" do
    #destroy session
    session[:name] = nil
    haml :login, :locals => {:msg => "You have successfully logged off!"}
  end
end