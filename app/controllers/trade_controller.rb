require_relative '../../app/models/trade/user'
class TradeController < Sinatra::Application
  get "/" do
    if session[:name]
      redirect '/buy'
    else
      redirect '/login'
    end
  end

  get "/buy" do
    haml :buy, :locals => {:users => User.all}
  end

  get "/item" do
    #list all (active) items  of all users
  end

  get "/item/:id" do
    #get item by id
  end

  get "/item/:id/buy" do
    #buy item, redirect to item details if successful
  end
end