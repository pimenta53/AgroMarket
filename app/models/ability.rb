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
        can :edit, Rating, :rater_id => user.id
        can :update, Rating, :rater_id => user.id

        can :read, Message
        can :create, Message
        can :new, Message

        can :read, Academy::Tutorial
        can :create, Academy::Tutorial
        can :new, Academy::Tutorial
        can :update, Academy::Tutorial, :user_id => user.id
        can :edit, Academy::Tutorial, :user_id => user.id

        can :read, Academy::Question
        can :new, Academy::Question
        can :create, Academy::Question
        can :update, Academy::Question, :user_id => user.id
        can :edit, Academy::Question, :user_id => user.id
        can :destroy, Academy::Question, :user_id => user.id


        can :create, Academy::Answer
        can :new, Academy::Answer
        can :read, Academy::Answer
        can :update, Academy::Answer, :user_id => user.id
        can :edit, Academy::Answer, :user_id => user.id
        can :destroy, Academy::Answer, :user_id => user.id


        can :read, Academy::Workshop
        can :create, Academy::Workshop
        can :new, Academy::Workshop

        can :read, Academy::WorkshopRegistration
        can :new, Academy::WorkshopRegistration
        can :create, Academy::WorkshopRegistration
        
        can :up_vote , Academy::Vote
        can :down_vote , Academy::Vote

        can :read, User
        can :update, User
        can :create, User


        can :update, Ad, :user_id => user.id
        can :update, Academy::Tutorial, :user_id => user.id

    elsif user.user_type == 2 #admin user
        can :manage, :all
    else
        ajkdsjaklsdjasjkl
        can :read, :all
    end

    
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
