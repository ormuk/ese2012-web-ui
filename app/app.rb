require 'rubygems'
require 'sinatra'

class App < Sinatra::Application
  get "/" do
    puts "sinatra is rolling..."
  end
end

App.run!