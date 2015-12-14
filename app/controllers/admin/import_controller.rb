class Admin::ImportController < ApplicationController
  before_action :authenticate_user! 
  before_action :require_admin

  def import
    Entry.import_entries(Import.import_osu_xml)
    redirect_to admin_import_info_path, notice: "import is successful"
  end

  def import_info
  end
  
end
