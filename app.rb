require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'json'

get '/:keyword' do
  url = "https://loremflickr.com/json/g/320/240/#{params[:keyword].downcase}/all"
  serialized_data = URI.parse(url).read
  data = JSON.parse(serialized_data)
  redirect data["rawFileUrl"]
end

get '/' do
  "Add a keyword at the end of the url like /cat"
end