
get '/login' do
  erb :loggin
end

post '/login' do
  user = User.find_by_username(params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/hello'
  else
    puts 'not user found'
    redirect '/login'
  end
end

get '/hello' do
  "#{session[:user_id]}"
end
