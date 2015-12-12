class UserDepartment < ActiveRecord::Base
  belongs_to :user
  belongs_to :departments, class_name: "Author", foreign_key: "author_id"
end
