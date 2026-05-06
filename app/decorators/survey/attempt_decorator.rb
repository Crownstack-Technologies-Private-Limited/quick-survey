module Survey
  class AttemptDecorator < Draper::Decorator
    delegate_all

    def display_score
      if survey.checklist?
        "#{score}/#{survey.questions.count}"
      else
        "#{score}%"
      end
    end
  end
end
