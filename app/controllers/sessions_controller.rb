class SessionsController < ApplicationController

  def create
    @user = set_user
    respond_to do |format|
      if @user # should be @user.authenticate?
        format.html { redirect_to movies_path, notice: 'User was successfully logged in.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout_user
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Successfully logged out.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(username: params[:user][:username])
      session[:user_id] = @user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username)
    end
end
