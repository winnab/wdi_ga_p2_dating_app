class Ability
  include CanCan::Ability

# users have 3 choices of PLANS: guest, standard, premium

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    # if user.role? :admin
    #     can :manage, :all
    # else
    #     can :read, :all
    # end

    if user.plan == 'standard' || user.plan == 'premium'
        can :read, :all
        can [:dashboard, :do_search, :new_search, :do_event], User

        # Messages
        can [:inbox, :create, :conversation], Message
        can :destroy, Message do |message|
          (message.sender.id == current_user.id) || (message.recipient.id == current_user.id)
        end
    else
      can :read, :all
      can [:do_search, :new_search], User
    end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
