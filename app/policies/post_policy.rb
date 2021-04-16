class PostPolicy
  attr_reader :user, :post
  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    user.has_role?(:admin)
  end
end