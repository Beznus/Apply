class AddAttachmentResumeToUserApplications < ActiveRecord::Migration
  def self.up
    change_table :user_applications do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :user_applications, :resume
  end
end
