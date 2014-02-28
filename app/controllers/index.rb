# NOTE / speak up if you see anything wrong in these routes

get '/' do

  erb :index
end

get '/surveys' do
  # QUESTION - go to erb to list all surveys? or list all by user?

  @surveys = Survey.all
  erb :surveys
end

post '/surveys'
  # create a new survey
  # this will update the survey table
end

get '/surveys/new' do
  # go to erb to create a new survey
  erb :create
end

get '/question/new'
  # keep track of the survery # in some way
end

post '/question/:surveyid'

end

