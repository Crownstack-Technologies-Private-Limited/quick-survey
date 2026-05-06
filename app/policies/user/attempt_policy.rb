module User
  class AttemptPolicy < User::BaseUserPolicy
    def delete_attempts?
      !user.member?
    end
  end
end
