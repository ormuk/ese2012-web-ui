require_relative '../../app/models/trade/user'
class UserController < Sinatra::Application

  attr_accessor :msg

 before do
  redirect to "/login" if session[:name].nil?
 end

 get "/user" do
   haml :users, :locals => {:current_page => :user}
 end

  get "/user/:name" do
    haml :user_view, :locals => {:user => User.by_name(params[:name]), :current_page => :user_view}
  end
end