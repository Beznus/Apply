class Author < ActiveRecord::Base
  has_one :entry
  def self.import_author(author_data)
    Author.find_or_create_by(name: author_data.css("name").inner_text).id 
  end
end
