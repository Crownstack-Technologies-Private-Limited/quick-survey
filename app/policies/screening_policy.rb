ScreeningPolicy = Struct.new(:user, :screening) do
  def index?
    !user.member?
  end
end
