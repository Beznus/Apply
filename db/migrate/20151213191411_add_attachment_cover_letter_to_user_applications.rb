class AddAttachmentCoverLetterToUserApplications < ActiveRecord::Migration
  def self.up
    change_table :user_applications do |t|
      t.attachment :cover_letter
    end
  end

  def self.down
    remove_attachment :user_applications, :cover_letter
  end
end
