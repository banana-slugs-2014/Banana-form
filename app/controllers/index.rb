get '/' do

  erb :index
end

get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end