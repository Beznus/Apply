class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy, :new_user_department]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = Admin::User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = Admin::User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  def new_user_department
    @user_department = UserDepartment.new(user_id: @admin_user.id)
    #respond_to do |format|
    #  format.js
    #end
  end

  def save_user_department
    @user_department = UserDepartment.create(user_id: params[:user_department][:user_id], author_id: params[:user_department][:author_id])
    redirect_to edit_admin_user_path(id: @user_department.user.id)
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = Admin::User.new(admin_user_params)
 
    if @admin_user.password.blank?
      secure_password = @admin_user.generate_password 
      @admin_user.password = secure_password
      @admin_user.password_confirmation = secure_password
    end

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    if params[:admin_user][:password].blank?
      params[:admin_user].delete :password
      params[:admin_user].delete :password_confirmation
    end  
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:admin_user).permit(:email, :user_type, :password, :password_confirmation, user_departments_attributes: [:id, :user_id, :author_id, :_destroy])
    end
end
