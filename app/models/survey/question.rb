module Survey
  class Question < ApplicationRecord
    self.table_name = "survey_questions"

    # acceptable_attributes :text, :survey, :options_attributes => Survey::Option::AccessibleAttributes

    # relations
    belongs_to :survey
    has_many :options, dependent: :destroy
    accepts_nested_attributes_for :options,
                                  reject_if: ->(a) { a[:text].blank? },
                                  allow_destroy: true

    # validations
    validates :text, presence: true, allow_blank: false

    def correct_options
      options.correct
    end

    def incorrect_options
      options.incorrect
    end

    def attempted_option(attempt)
      answer = attempted_answer(attempt)
      return nil if answer.nil?

      option_id = answer.option_id
      Survey::Option.find(option_id)
    end

    def attempt_checked?(attempt)
      attempted_answer(attempt).present?
    end

    def attempted_answer(attempt)
      attempt.answers.find { |a| a.question_id == id }
    end

    def marked_score(attempt)
      answer = attempted_answer(attempt)
      return 0 if answer.nil?

      answer.score
    end
  end
end
