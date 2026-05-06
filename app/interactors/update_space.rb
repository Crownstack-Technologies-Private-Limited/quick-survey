class UpdateSpace < Patterns::Service
  def initialize(space, actor, users, params)
    @space = space
    @actor = actor
    @users = users.compact_blank.map(&:to_i)
    @params = params
  end

  def call
    begin
      update_space
      update_space_users
      send_email
    rescue StandardError
      space
    end
    space
  end

  def update_space
    @space.update(params)
  end

  def update_space_users
    space.users.clear
    space.users << User.where(id: users)
    space.users << space.user unless space.users.include?(space.user)
    space.touch
  end

  def send_email
    return unless space.users.size.positive?

    @space_users = User.where(id: users)
    @space_users.each do |user|
      SpacesMailer.with(actor: actor, user: user, space: space).update_space_email.deliver_later if deliver_email?(user)
    end
  end

  def deliver_email?(user)
    (actor != user) and user.email_enabled and user.sign_in_count.positive?
  end

  attr_reader :space, :actor, :users, :params
end
