require_relative '../../app/models/trade/user'
require_relative '../../app/models/trade/item'
class TradeController < Sinatra::Application
  get "/" do
    if session[:name]
      redirect '/item'
    else
      redirect '/login'
    end
  end

  get "/item" do
    haml :item, :locals => {:users => User.all}
  end

  get "/item/:id" do
    haml :item_view, :locals => {:item => Item.by_id(params[:id].to_i)}
  end

  get "/item/:id/buy" do
    if User.by_name(session[:name]) == Item.by_id(params[:id].to_i).owner
      "This is your own item!"
    else
      User.by_name(session[:name]).buy(Item.by_id(params[:id].to_i))
      haml :item_view, :locals => {:item => Item.by_id(params[:id].to_i)}
    end
  end
end