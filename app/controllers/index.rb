get '/' do
  erb :index
end

get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

post '/surveys' do
  id = Survey.create!(title: params[:title]).id
  redirect "/questions/#{id}/new"
end

get '/surveys/new' do
  erb :create
end

get '/surveys/:id' do
  @survey = Survey.find( params[:id] )
  @question = @survey.questions.includes(:choices)
  erb :survey_overview
end


get '/surveys/take/:id' do
  @survey = Survey.find( params[:id] )
  @question = @survey.questions.includes(:choices)
  erb :take_survey
end

post '/surveys/take/:id' do
# create completed_survey
# save responses
end


get '/questions/:id/new' do
  @survey_id = params[:id]
  erb :create_question
end

post '/questions/:survey_id' do
  @question = Question.create!(survey_id: params[:survey_id], question_text: params[:question_text])
  @question.choices.create(choice_text: params[:choice_1])
  @question.choices.create(choice_text: params[:choice_2])
  @question.choices.create(choice_text: params[:choice_3])
  @question.choices.create(choice_text: params[:choice_4])
  redirect "/questions/#{params[:survey_id]}/new"
end

