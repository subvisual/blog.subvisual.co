class SessionsController < Clearance::SessionsController
  def create
    @user = OauthUser.new.find_or_create_from_oauth_hash(auth_hash)
    sign_in(@user)
    redirect_back_or url_after_create
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
