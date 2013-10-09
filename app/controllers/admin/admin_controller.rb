module Admin
  class AdminController < ::ApplicationController

    def is_admin_controller?
      true
    end

    authorize_resource

    def dashboard
    end

  end
end
