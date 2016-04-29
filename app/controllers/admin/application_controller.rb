class Admin::ApplicationController < ApplicationController

  before_action :authenticate_admin!

  def index

  end

  private

    def authenticate_admin!
      authenticate_user!

      unless current_user.try(:admin?)
        redirect_to root_path, alert: "You're not authorized"
      end
    end

end
