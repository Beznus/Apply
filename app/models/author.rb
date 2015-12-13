class Author < ActiveRecord::Base
  has_many :entries
  has_many :user_applications, through: :entries
  has_many :user_departments
  has_many :users, through: :user_departments

  def self.import_author(author_data)
    Author.find_or_create_by(name: author_data.css("name").inner_text).id 
  end
end
