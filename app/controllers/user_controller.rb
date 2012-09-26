class UserController < Sinatra::Application
 get "/user" do
   #list all users
 end

  get "/user/:id" do
    #details for a user, including his items for sale and all items (if the user is looking at himself)
  end
end