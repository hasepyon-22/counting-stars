require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models'

enable :sessions


helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end

get '/' do
  erb :signin
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
    redirect '/list'
  end
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  # img_url = ''
  # if params[:file]
  #   img = params[:file]
  #   tempfile = img[:tempfile]
  #   upload = Cloudinary::Uploader.upload(tempfile.path)
  #   img_url = upload['url']
  # end

  @user = User.create(name:params[:name], password:params[:password], password_confirmation:params[:password_confirmation])

  if @user.persisted?
    session[:user] = @user.id
    redirect '/list'
  end


  redirect '/'
end

get '/list' do
  @counts = Count.all

  erb :list
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end

get '/new' do

  erb :new
end

post '/new' do
  count = Count.create(title:params[:title], number:0, user_id:current_user.id)

  redirect '/list'
end

post '/count/:id/plus' do
  count = Count.find(params[:id])
  count.number = count.number + 1
  count.save

  if !CountUser.find_by(user_id: current_user.id, count_id: params[:id])
    CountUser.create(user_id: current_user.id, count_id: params[:id])
  end

  redirect '/list'
end

get '/user/:id' do
  @counts = Count.where(user_id: params[:id])
  erb :user
end

get '/count/:id' do
  @countedusers = CountUser.where(count_id: params[:id])
  erb :count
end