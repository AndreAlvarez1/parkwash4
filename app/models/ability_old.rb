
class Ability
  include CanCan::Ability

  def initialize(user)

    if user.class = User

      return unless user.present?

      # Permits regarding USERS
      can :read, User, user_id: user.id # if the user is logged in, he can read its profile
      can :update, User, user_id: user.id # if the user is logged in, he can update its profile
      can :edit, User, user_id: user.id # if the user is logged in, he can edit its profile

      # Permits regarding VEHICLES
      can :create, Vehicle, user_id: user.id # if the user is logged in, he can create own vehicles
      can :read, Vehicle, user_id: user.id # if the user is logged in, he can read his vehicles
      can :update, Vehicle, user_id: user.id # if the user is logged in, he can update his vehicles
      can :edit, Vehicle, user_id: user.id # if the user is logged in, he can edit his vehicles

      # Permits regarding WASHES
      can :read, Wash, user_id: user.id # if the user is logged in, he can read his washes

      # Permits regarding PAYMENTS
      can :read, Payment, user_id: user.id # if the user is logged in, he can read his payments

      # Permits regarding PLACES
      can :read, Place, user_id: user.id # if the user is logged in, he can read his places


    elsif user.class = Washer

      return unless user.present? #All roles of Washers can do the following when logged in

      # Permits regarding WASHERS
      can :read, Washer, washer_id: user.id # if the washer is logged in, he can read his profile
      can :update, Washer, washer_id: user.id # if the washer is logged in, he can update his profile
      can :edit, Washer, washer_id: user.id # if the washer is logged in, he can edit his profile

      # Permits regarding WASHES
      can :create, Wash, washer_id: user.id # if the washer is logged in, he can create washes under his name
      can :read, Wash, washer_id: user.id # if the user is logged in, he can read his washes
      can :update, Wash, washer_id: user.id # if the user is logged in, he can update his washes
      can :edit, Wash, washer_id: user.id # if the user is logged in, he can edit his washes

      return unless user.supervisor? # if the washer is a supervisor we give additional permissions

      # Permits regarding WASHERS
      can :read, Washer, # if the washer is supervisor, he can read any washer
      can :update, Washer, # if the washer is supervisor, he can update any washer
      can :edit, Washer, # if the washer is supervisor, he can edit any washer

      # Permits regarding WASHES
      can :create, Wash, # if the washer is supervisor, he can create any wash
      can :read, Wash, # if the washer is supervisor, he can read all washes
      can :update, Wash, # if the washer is supervisor, he can update all washes
      can :edit, Wash, # if the washer is supervisor, he can edit all washes
      can :destroy, Wash, # if the washer is supervisor, he can destroy all washes

      return unless user.admin? # if the washer is a admin we give additional permissions

      # Admin can Read Everything
      can :read, User, # if the washer is admin, he can read all users
      can :read, Washer, # if the washer is admin, he can read all washers
      can :read, Wash, # if the washer is admin, he can read all washers
      can :read, Vehicle, # if the washer is admin, he can read all vehicles
      can :read, Place, # if the washer is admin, he can read all places
      can :read, Payment, # if the washer is admin, he can read all payments
      can :read, Receipt, # if the washer is admin, he can read all payments
      can :read, Credit_note, # if the washer is admin, he can read all payments
      can :read, Reconciliation, # if the washer is admin, he can read all payments
      can :read, Wash_type, # if the washer is admin, he can read all payments
      can :read, Vehicle_size, # if the washer is admin, he can read all washes
      can :read, Price, # if the washer is admin, he can read all washes

      return unless user.superadmin? # if the washer is a admin we give remaining permissions
      can :manage, :all

    end

  end

end


  # def initialize(user)
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
      # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  # end
