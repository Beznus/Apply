class UserApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_application, only: [:show, :destroy]
 
  # GET /user_applications
  # GET /user_applications.json
  def index
    @user_applications = current_user.user_applications.all
  end

  # GET /user_applications/1
  # GET /user_applications/1.json
  def show
  end

  # GET /user_applications/new
  def new
    @entry = Entry.find(params[:entry_id])
    @user_application = current_user.user_applications.new
  end

    # POST /user_applications
  # POST /user_applications.json
  def create
    @user_application = current_user.user_applications.new(user_application_params)
    @entry = Entry.find(@user_application.entry.id)
    respond_to do |format|
      if @user_application.save
        format.html { redirect_to user_application_path(id: @user_application, entry_id: @user_application.entry.id), notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @user_application }
      else
        format.html { render :new, entry_id: @user_application.entry.id }
        format.json { render json: @user_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_applications/1
  # DELETE /user_applications/1.json
  def destroy
    @user_application.destroy
    respond_to do |format|
      format.html { redirect_to user_applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_application
      @entry = Entry.find(params[:entry_id])
      @user_application = current_user.user_applications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_application_params
      params.require(:user_application).permit(:user_id, :entry_id, :statement, :cover_letter, :resume)
    end
end
