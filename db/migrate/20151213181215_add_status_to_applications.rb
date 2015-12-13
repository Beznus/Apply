class AddStatusToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :status, :string, default: "New"
  end
end
