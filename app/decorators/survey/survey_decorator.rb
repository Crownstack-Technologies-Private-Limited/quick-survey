module Survey
  class SurveyDecorator < Draper::Decorator
    delegate_all

    def survey_type_color
      if checklist?
        "yellow"
      elsif score?
        "gray"
      end
    end

    def survey_for_color
      if candidate?
        "gray"
      elsif user?
        "green"
      end
    end

    def display_survey_type
      survey_type.titleize
    end

    def display_survey_for
      if survey_for == "user"
        "Team"
      else
        survey_for.titleize
      end
    end

    def display_name
      name.upcase_first
    end
  end
end
