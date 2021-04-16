class PostPolicy
  attr_reader :user, :post
  def initialize(user, post)
    @user = user
    @post = post
  end

  # def edit?
  #   user.has_role?(:admin) || (post.user == user)
  # end

  # def update?
  #   user.has_role?(:admin) || (post.user == user)
  # end

  # def destroy?
  #   user.has_role?(:admin) || (post.user == user)
  # end

  def access?
    user.has_role?(:admin) || (post.user == user)
  end
end