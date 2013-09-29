module Admin
  class UsersController < Admin::AdminController

    def index
      @users = User.all
    end

    def update
      @user = User.find params[:id]

      if @user.update(user_params)
        redirect_to admin_users_path, alert: 'Author successfully saved'
      else
        redirect_to :index
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :twitter_handle, :bio, :password)
    end

  end
end
