class AddSpace < Patterns::Service
  def initialize(space_params, actor, users)
    @space = Space.new(space_params)
    @actor = actor
    @users = users
  end

  def call
    begin
      create_space
      space_users
      send_email
    rescue StandardError
      space
    end
    space
  end

  def create_space
    space.save!
  end

  def space_users
    space.users << User.where(id: users)
    space.users << actor unless space.users.include?(actor)
  end

  def send_email
    return unless users.size.positive?

    @space_users = User.where(id: users)
    @space_users.each do |user|
      SpacesMailer.with(actor: actor, user: user, space: space).space_email.deliver_later if deliver_email?(user)
    end
  end

  def deliver_email?(user)
    (actor != user) and user.email_enabled and user.sign_in_count.positive?
  end

  attr_reader :space, :actor, :users
end
