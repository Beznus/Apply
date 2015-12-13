class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_departments
  has_many :departments, through: :user_departments 

  USER_TYPES = %w[admin department applicant]
  
  def admin?
    self.user_type == "admin"
  end
end
