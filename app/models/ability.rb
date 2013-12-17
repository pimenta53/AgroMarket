class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.user_type == 1 #normal user    
        can :read, Ad
        can :create, Ad
        can :new, Ad
        can :read, Rating
        can :create, Rating
        can :new, Rating
        can :read, Message
        can :create, Message
        can :new, Message
        can :read, Academy::Tutorial
        can :create, Academy::Tutorial
        can :new, Academy::Tutorial
        can :read, Academy::Question
        can :new, Academy::Question
        can :create, Academy::Question

        can :create, Academy::Answer
        can :new, Academy::Answer
        can :read, Academy::Answer



        can :read, Academy::Workshop
        can :create, Academy::Workshop
        can :new, Academy::Workshop

        can :read, Academy::WorkshopRegistration
        can :new, Academy::WorkshopRegistration
        can :create, Academy::WorkshopRegistration
        
        can :up_vote , Academy::Vote
        can :down_vote , Academy::Vote

        can :read, User

    elsif user.user_type == 2 #admin user
        can :manage, :all
    else
        can :read, :all
    end

    can :update, Ad, :user_id => user.id
    can :update, Academy::Tutorial, :user_id => user.id

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
