class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :survey

  def self.to_csv
    answers = all

    CSV.generate do |csv|
      csv << %w[Section Question Answer User]

      answers.each do |answer|
        csv << [
          answer.question.section.name,
          answer.question.name,
          if answer.question.text_free?
            answer.name
          else
            Option.find(answer.name).name.to_plain_text
          end,
          answer.user_token
        ]
      end
    end
  end
end
