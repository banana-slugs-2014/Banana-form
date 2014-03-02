
get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by_username(params[:username])
  if user.password== params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    puts 'not user found'
    redirect '/login'
  end
end

get '/user/new' do
  erb :create_account
end

post '/user' do
  user = User.create(params)
  if !user.errors.any?
    redirect "/"
  else
    # TODO: add error handling here
    redirect "/user/new"
  end
end

get '/hello' do
  "#{session[:user_id]}"
end

get '/logout' do
  session.clear
  redirect "/"
end