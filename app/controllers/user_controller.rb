require '/app/models/trade/user.rb'
class UserController < Sinatra::Application
 get "/user" do
   haml :users
 end

  get "/user/:name" do
    haml :user_view, :locals => { :user => User.by_name(:name)}
  end
end