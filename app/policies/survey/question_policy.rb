module Survey
  class QuestionPolicy < Survey::BaseSurveyPolicy
    def index?
      !user.member?
    end

    def edit?
      !user.member?
    end

    def new?
      edit?
    end

    def update?
      edit?
    end

    def destroy?
      edit?
    end
  end
end
