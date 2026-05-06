class UserController < BaseController
  before_action :set_user, only: %i[update_password update_profile profile password]
  before_action :build_form, only: %i[update_password password]
  respond_to :html, :json

  def update_permission
    authorize @user
    redirect_to user_index_path, notice: "User was updated successfully" if @user.update(permission)
  end

  def update_profile
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@user, partial: "user/forms/profile",
                                                           locals: { message: "User was updated successfully", user: @user })
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@user, partial: "user/forms/profile", locals: { user: @user })
        end
      end
    end
  end

  def update_password
    authorize @user
    respond_to do |format|
      if @form.submit(change_password_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@user, partial: "user/forms/password",
                                                           locals: { message: "Password was updated successfully", user: @user })
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@user, partial: "user/forms/password", locals: { user: @user })
        end
      end
    end
  end

  def profile
    authorize @user
  end

  def password
    authorize @user
  end

  private

  def set_user
    @set_user ||= current_user
  end

  def permission
    params.expect(user: [:permission])
  end

  def user_params
    params.expect(user: %i[first_name last_name email])
  end

  def change_password_params
    params.expect(user: %i[original_password new_password new_password_confirmation])
  end

  def build_form
    @build_form ||= ChangePasswordForm.new(@user)
  end
end
