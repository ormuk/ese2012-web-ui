require_relative '../../app/models/trade/user'
class UserController < Sinatra::Application

 before do
  redirect to "/login" if session[:name].nil?
 end

 get "/user" do
   haml :users
 end

  get "/user/:name" do
    haml :user_view, :locals => {:user => User.by_name(params[:name])}
  end
end