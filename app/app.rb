require 'rubygems'
require 'sinatra'
require 'require_relative'
require 'controllers/login_controller'
require 'controllers/trade_controller'
require 'controllers/user_controller'

class App < Sinatra::Base

  use LoginController
  use UserController
  use TradeController

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do
   #TODO Testdaten initialisieren
  end
end

App.run!