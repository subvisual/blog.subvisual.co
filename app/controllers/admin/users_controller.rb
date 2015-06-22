class Admin::UsersController < Admin::ApplicationController
  decorates_assigned :user

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to admin_dashboard_path, alert: 'Author successfully saved'
    else
      redirect_to :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :twitter_handle, :bio, :password)
  end
end
