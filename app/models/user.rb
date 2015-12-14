class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_departments
  has_many :admin_applications, through: :departments, source: "user_applications"
  has_many :departments, through: :user_departments 
  has_many :user_applications

  accepts_nested_attributes_for :user_departments, allow_destroy: true

  USER_TYPES = %w[admin department applicant]

  def generate_password
    secure_password = SecureRandom.hex(8)
  end
  
  def admin?
    self.user_type == "admin"
  end

  def department?
    self.user_type == "department"
  end

  def permitted_applications
    if self.user_type == "admin"
      return UserApplication.all
    elsif self.user_type == "department" 
      return self.admin_applications
    else
      return nil
    end
  end
end
