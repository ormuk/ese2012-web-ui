require 'rubygems'
require 'sinatra'
require 'require_relative'
require 'controllers/login_controller'
require 'controllers/trade_controller'
require 'controllers/user_controller'
require 'models/trade/user'
require 'models/trade/item'
class App < Sinatra::Base

  @@users = Array.new

  use LoginController
  use UserController
  use TradeController

  enable :sessions
  set :public_folder, 'app/public'

  #filter that redirects users to login if necessary
  before do
    if session[:name].nil?
        redirect to "/login"
    end
  end

  configure :development do
    ese = User.new('ese')
    ese.add_item(Item.new('script',5))
    ese.add_item(Item.new('beamer', 650))
    ese.items[0].state = :active
    ese.save

    suti = User.new('suti')
    suti.add_item(Item.new('macbook pro',5000))
    suti.add_item(Item.new('banane', 1))
    suti.add_item(Item.new('stuhl', 25))
    suti.save

    flo = User.new('flo')
    flo.add_item(Item.new('macbook air',2500))
    flo.add_item(Item.new('apfel', 1))
    flo.add_item(Item.new('tisch', 156))
    flo.save
  end
end

App.run!