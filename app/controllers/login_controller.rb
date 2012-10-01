require 'haml'
require_relative '../../app/models/trade/user'
class LoginController < Sinatra::Application

  attr_accessor :msg

  post "/login" do
    #login duh!?
    user =  User.by_name params[:username]
    if user.nil? or user.name != params[:password]
      self.msg =  "User or password incorrect."
      haml :'login/login', :layout => :'login/layout'
    else
      session[:name] = user.name
      redirect '/'
    end
  end

  get "/login" do
    haml :'login/login', :layout => :'login/layout'
  end

  get "/logout" do
    #destroy session
    session.clear
    self.msg = "You have successfully logged off."
    haml :'login/login', :layout => :'login/layout'
  end
end