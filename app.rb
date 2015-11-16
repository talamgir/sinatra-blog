require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'
require './models.rb'
require 'rerun'


set :database, "sqlite3:db/database.sqlite3"

enable :sessions

def this_user
	if session[:user_id]
		User.find session[:user_id]
	end
end

get '/' do
	erb :index
end

get '/signup' do
	erb :signup
end

post '/signup' do
	@user = User.create(email: params[:email], fname: params[:fname], lname: params[:lname], password: params[:password])

	if 
		@user.save
		session[:user_id] = @user_id
		redirect to ("/profile")

	else
		render :signup
	end
end


get '/login' do
	erb :login
end

post '/login_verify' do
	match_user = User.all.where({
		:email=> "#{params[:email]}",
		:password=> "#{params[:password]}"
		})

	if match_user.first
		session[:user_id] = match_user.first.id
		redirect to ("/profile")
	else
		render :login
	end
end

get '/profile' do
	if this_user
		@user = User.find(session[:user_id])
		erb :profile
	else
		redirect to("/login")
	end
end

get '/post' do
	erb :post
end

post '/enter_post' do
	@user = this_user.email
	@post = Post.create({content: params[:content], body: params[:body], user_id: session[:user_id] })
	redirect to("/feed")
end

get '/feed' do
	@post = Post.all
	erb :feed
end

get '/edit' do
	@post = Post.all
	erb :edit
end

put '/update' do
	session[:user_id] = @user_id
	@post = Post.find_by(@user_id)
	@post.update(content: params[:content], body: params[:body])

	redirect to("/profile")
end

get '/logged_out' do
	session[:user_id] = nil
	redirect to ("/")
	erb :logged_out
end

delete '/delete' do
	session.clear
	this_user.destroy
	erb :edit
end





