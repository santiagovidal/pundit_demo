class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    raise Pundit::NotAuthorizedError, "You must be logged in to perform this action" unless user
    @user = user
    @post = post
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    !post.user.is_admin || user.is_admin
  end

  def index?
    true
  end

  def destroy?
    post.user.id == user.id || user.is_admin
  end
end


# SCOPES
# after_action :verify_authorized & after_action :verify_policy_scoped & skip_authorization
# Strong parameters
# RSPEC
