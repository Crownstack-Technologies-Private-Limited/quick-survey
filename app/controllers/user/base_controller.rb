module User
  class BaseController < ApplicationController
    before_action :set_user, only: %i[index delete_attempts]
    after_action :verify_authorized
    include Pagy::Backend

    LIMIT = 20

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
