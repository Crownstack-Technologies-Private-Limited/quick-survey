module User
  class BaseUserPolicy < ApplicationPolicy
    def index?
      true
    end
  end
end
