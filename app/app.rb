ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peeps'

class Peep < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  helpers do
 	def current_user
   		@current_user ||= User.first(id: session[:user_id])
 	end
  end

  before do
  	@peeps = Peeps.all
  	@user ||= User.get(session[:user_id])
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
  	erb :index
  end

  get '/user/new' do
  	erb :new_user
  end

  post '/user/new' do
  	user = User.create(name: params[:name],
  				email: params[:email],
  				password: params[:password])
  	redirect '/peeps'
  end

  get '/user/signin' do
  	erb :sign_in
  end

  post '/user/signin' do
  	user = User.authenticate(params[:email],
  							params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect '/peeps'
  	else
  		flash.now[:errors] = 'The email or password used is incorrect'
  		erb :sign_in
  	end
  end

  post '/peep/new' do
  	peep = Peeps.create(content: params[:content],
  						time: (Time.now.strftime("%A %d of %b %Y, %l:%M %p")))
  	user = User.get(session[:user_id])
  	user.peepss << peep
  	user.save
  	redirect '/'
  end

  post '/end-session' do
    session[:user_id] = nil
    flash.keep[:notice] = ['goodbye!']
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
