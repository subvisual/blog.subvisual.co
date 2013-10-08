module Admin
  class AdminController < ::ApplicationController

    layout 'admin'

    authorize_resource

    def dashboard
    end

  end
end
