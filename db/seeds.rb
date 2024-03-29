
bob = User.create(username: "bob", password: "123")
tom = User.create(username: "tom", password: "123")
tim = User.create(username: "tim", password: "123")
bananaphone = User.create(username: "bananaphone", password: "123")


firstpost = bob.surveys.create(title: "Test Survey")
monkey = bob.surveys.create(title: "Monkey Post")
20.times do
  q1 = firstpost.questions.create(question_text: "The answer is A")
  q2 = firstpost.questions.create(question_text: "The answer is B")
  q3 = firstpost.questions.create(question_text: "The answer is Dr. Who")

  [q1, q2, q3].each do |question|
    [ "first answer", "answer b", "Dr. Who", "Glen" ].each_with_index do |text, index|
      choice = question.choices.create( choice_text: text )
    end
    Response.create( user_id: tom.id, choice_id: Choice.last.id - rand(3))
    Response.create( user_id: bananaphone.id, choice_id: Choice.last.id - rand(3))
    Response.create( user_id: tim.id, choice_id: Choice.last.id - rand(3))
  end
end

bob.completed_surveys.create(survey_id: firstpost.id)
