class User < ApplicationRecord
  # relations
  has_many :jogging_times
  #  jwt stuff
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # cancancan stuff
  def admin?
    role == 'admin'
   end

  def user_manager?
    role == 'user_manager'
  end

  def user?
    role == 'user'
  end
  
end
