class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey

  def response_count
    total = 0
    choices.each do |choice|
      total += choice.responses.count
    end
    total
  end

  def percentage(n)
    n*100/response_count
  end

end
