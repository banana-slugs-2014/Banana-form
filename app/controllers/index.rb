get '/' do
  erb :index
end

get '/surveys' do
  @surveys = Survey.all
  @my_surveys = current_user_surveys
  erb :surveys
end

post '/surveys' do
  id = Survey.create!(title: params[:title]).id
  redirect "/questions/#{id}/new"
end

get '/surveys/new' do
  if logged_in?
    erb :create
  else
    redirect "/login"
  end
end

get '/stats/:id' do
  @survey = Survey.find(params[:id])
  @question = @survey.questions.includes(choices: :responses)
  erb :history
end

get '/surveys/:id' do
  @survey = Survey.find( params[:id] )
  @question = @survey.questions.includes(:choices)
  erb :survey_overview
end


get '/surveys/take/:id' do
  if logged_in?
    @survey = Survey.find( params[:id] )
    @question = @survey.questions.includes(:choices)
    erb :take_survey
  else
    redirect "/login"
  end
end

post '/surveys/take' do
  if logged_in?
    user = User.find(session[:user_id])
    params.each_value do |value|
      Response.create( choice_id: value, user_id: user.id)
    end
    redirect '/'
  else
    redirect '/login'
  end
end

get '/questions/:id/new' do
  @survey_id = params[:id]
  erb :create_question, layout: false
end

post '/questions/:survey_id' do
  @question = Question.create!(survey_id: params[:survey_id],
    question_text: params[:question_text])
  @question.choices.create(choice_text: params[:choice_1])
  @question.choices.create(choice_text: params[:choice_2])
  @question.choices.create(choice_text: params[:choice_3])
  @question.choices.create(choice_text: params[:choice_4])
end

