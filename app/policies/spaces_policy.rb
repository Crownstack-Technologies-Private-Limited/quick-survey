SpacesPolicy = Struct.new(:user, :spaces) do
  def index?
    true
  end

  def create?
    !user.member?
  end

  def new?
    !user.member?
  end
end
