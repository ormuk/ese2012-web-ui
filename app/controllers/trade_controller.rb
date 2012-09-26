class TradeController < Sinatra::Application
  get "/" do
    #main screen
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