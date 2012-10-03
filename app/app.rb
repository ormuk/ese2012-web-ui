require 'rubygems'
require 'sinatra'
require 'require_relative'
require_relative 'controllers/login_controller'
require_relative 'controllers/trade_controller'
require_relative 'controllers/user_controller'
require_relative 'models/trade/user'
require_relative 'models/trade/item'
class App < Sinatra::Base

  @@users = Array.new

  use LoginController
  use UserController
  use TradeController

  enable :sessions
  set :public_folder, 'app/public'

  #filter that redirects users to login if necessary
  before do
    redirect to "/login" if session[:name].nil?
  end

  configure :development do
    ese = User.new('ese')
    ese.add_item(Item.new('Script',5))
    ese.add_item(Item.new('Beamer', 250))
    ese.save

    suti = User.new('suti')
    suti.add_item(Item.new('Hocker',20))
    suti.add_item(Item.new('Banane', 1))
    suti.add_item(Item.new('Stuhl', 25))
    suti.add_item(Item.new('Lampe', 10))
    suti.save

    flo = User.new('flo')
    flo.add_item(Item.new('MacBook Air',2500))
    flo.add_item(Item.new('Apfel', 1))
    flo.add_item(Item.new('Tisch', 156))
    flo.add_item(Item.new('Tastatur', 30))
    flo.save

    Item.all.each{ |item| item.state = :active}
  end
end

App.run!
