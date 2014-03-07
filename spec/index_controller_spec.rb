require 'spec_helper'

describe "index" do
  it 'should render the home(index) page' do
    get '/'
    expect(last_response).to be_ok
  end
end

describe "surveys" do
  before(:all) do
    user_test = User.create(username: "bob", password: "123")
    survey_test = user_test.surveys.create(title: "Test Survey")
    question_text = survey_test.questions.create(question_text: "The answer is A")
    Response.create( user_id: user_test.id, choice_id: question_text.id)
  end

  it 'should show the stats from a certain survey' do
    get '/stats/1'
    expect(last_response.body).to include("Test Survey")
  end

  it 'should render the surveys page'
  # get '/surveys' do
  it 'should create a new survey'
  # post '/surveys' do
  it 'should provide a new form to create a survey'
  # get '/surveys/new' do
  it 'should show an overview of a certain survey'
  # get '/surveys/:id' do
  it 'should allow the user to submit a response to a certain survey'
  # get '/surveys/take/:id' do
  it 'should provide a form to complete a survey for a certain user'
  # post '/surveys/take' do
  it 'should allow the user to create new questions for a survey'
  # post '/questions/:survey_id' do
  it 'should all the user to respond to a questions'
  # get '/questions/:id/new' do
end








