class AddAttachmentCoverLetterToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :cover_letter
    end
  end

  def self.down
    remove_attachment :users, :cover_letter
  end
end
