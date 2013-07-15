class UsersController < Clearance::UsersController
  def new
    handle_disabled_registration
  end

  def create
    handle_disabled_registration
  end

  protected

  def handle_disabled_registration
    redirect_to sign_in_path, notice: t('flashes.registration_disabled')
  end
end
