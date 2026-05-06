module Survey
  class Attempt < ApplicationRecord
    acts_as_tenant :account
    self.table_name = "survey_attempts"

    #   acceptable_attributes :winner, :survey, :survey_id,
    #     :participant,
    #     :participant_id,
    #     :answers_attributes => ::Survey::Answer::AccessibleAttributes

    # relations
    belongs_to :survey
    belongs_to :participant
    belongs_to :actor, class_name: "User"
    has_many :answers, dependent: :destroy
    accepts_nested_attributes_for :answers,
                                  reject_if: ->(q) { q[:question_id].blank? || q[:option_id].blank? }

    # validations
    validate :check_number_of_attempts_by_survey

    # scopes
    scope :wins, -> { where(winner: true) }
    scope :looses, -> { where(winner: false) }
    scope :scores, -> { order("score DESC") }
    scope :for_survey, ->(survey) { where(survey_id: survey.id) }
    scope :exclude_survey, ->(survey) { where("NOT survey_id = #{survey.id}") }
    scope :for_participant, lambda { |participant|
      where(participant_id: participant.try(:id))
    }

    # callbacks
    before_create :collect_scores

    def correct_answers
      answers.where(correct: true)
    end

    def incorrect_answers
      answers.where(correct: false)
    end

    def self.high_score
      scores.first.score
    end

    private

    def check_number_of_attempts_by_survey
      attempts = self.class.for_survey(survey).for_participant(participant)
      upper_bound = survey.attempts_number

      return unless attempts.size >= upper_bound && upper_bound != 0

      errors.add(:survey_id, "Number of attempts exceeded")
    end

    def collect_scores
      self.score = answers.sum(&:value) || 0
    end
  end
end
