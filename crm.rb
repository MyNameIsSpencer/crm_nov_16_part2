require_relative 'contact'
require 'sinatra'

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
end

get '/' do
  redirect to('/home')
end

get '/index' do
  redirect to('/home')
end

get '/home' do
  erb :index
end

get '/about' do
  erb :about
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end









after do
  ActiveRecord::Base.connection.close
end
