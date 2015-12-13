class RenameApplicationsTableName < ActiveRecord::Migration
  def change
    rename_table :applications, :user_applications
  end
end
