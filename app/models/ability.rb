class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post # start by defining rules for all users, also not logged ones
    can :read, Comment
    can :read, User
    return unless user.present?

    can :manage, Post, author_id: user.id # if the user is logged in can manage it's own posts
    can :manage, Comment, user_id: user.id # if the user is logged in can manage it's own comments
    return unless user.is? :admin # if the user is a manager we give additional permissions

    can :manage, :all # finally we give all remaining permissions only to the admins
  end
end
