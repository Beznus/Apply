class Admin::UserApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin_or_department
  before_action :set_admin_user_application, only: [:show, :edit, :update, :destroy]
  
  # GET /admin/user_applications
  # GET /admin/user_applications.json
  def index
    @admin_user_applications = current_user.permitted_applications
  end

  # GET /admin/user_applications/1
  # GET /admin/user_applications/1.json
  def show
  end

  # GET /admin/user_applications/1/edit
  def edit
  end

  # PATCH/PUT /admin/user_applications/1
  # PATCH/PUT /admin/user_applications/1.json
  def update
    respond_to do |format|
      if @admin_user_application.update(admin_user_application_params)
        format.html { redirect_to admin_user_applications_path, notice: 'User application was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user_application }
      else
        format.html { render :edit }
        format.json { render json: @admin_user_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/user_applications/1
  # DELETE /admin/user_applications/1.json
  def destroy
    @admin_user_application.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_applications_url, notice: 'User application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user_application
      @admin_user_application = current_user.permitted_applications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_application_params
      params.require(:user_application).permit(:status)
    end
end
