require_relative '../../app/models/trade/user'
require_relative '../../app/models/trade/item'
class TradeController < Sinatra::Application

  attr_accessor :msg

  before do
    redirect to "/login" if session[:name].nil?
  end

  get "/" do
    redirect '/item'
  end

  get "/item" do
    #@available_items = (Item.all.detect{ |item| item.state == :active and item.owner.name == session[:name]}.nil?)
    haml :item, :locals => {:users => User.all}
  end

  get "/item/:id" do
    haml :item_view, :locals => {:item => Item.by_id(params[:id].to_i), :user => User.by_name(params[:name])}
  end

  get "/item/:id/sell" do
    if session[:name] == Item.by_id(params[:id].to_i).owner.name
      Item.by_id(params[:id].to_i).state = :active
      redirect "/user/#{session[:name]}"
    end
  end

  get "/item/:id/buy" do
    if User.by_name(session[:name]) == Item.by_id(params[:id].to_i).owner
      redirect "/user/#{session[:name]}"
    else
      User.by_name(session[:name]).buy(Item.by_id(params[:id].to_i))
      haml :item, :locals => {:users => User.all}
    end
  end
end