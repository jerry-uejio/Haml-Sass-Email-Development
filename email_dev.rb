require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

get '/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"#{params[:name]}", Compass.sass_engine_options )
end


get '/:name.html' do
  haml :"#{params[:name]}"
end
