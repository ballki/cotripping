class UsersController < ApplicationController
  before_filter :validate_authorization_for_user, only: [:edit, :update]
def show
	# if params[:id]
	#   @user = User.find(params[:id])
	# else
	  @user = current_user
	# end
end

def index
	@user = User.all
end


  # GET /users/1/edit
  def edit
  end


  # PATCH/PUT /users/1
  def update
    # render json: business_params
    respond_to do |format|
      if @user.update(user_params)
     # @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def validate_authorization_for_user
       redirect_to root_path unless @user == current_user
    end
    
  def user_params
      params.require(:user).permit(:name, :email, :location)
    end
end
