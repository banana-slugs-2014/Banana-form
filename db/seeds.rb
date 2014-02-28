firstpost = Survey.create!(title: "Test Survey")
monkey = Survey.create!(title: "Monkey Post")

q1 = firstpost.questions.create!(question_text: "The answer is A")
q2 = firstpost.questions.create!(question_text: "The answer is B")
q3 = firstpost.questions.create!(question_text: "The answer is Dr. Who")

[q1,q2,q3].each do |question|
  [ "first answer", "answer b", "Dr. Who", "Glen" ].each do |text|
    question.choices.create( choice_text: text )
  end
end


