class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  before_action :check_admin, if: :admin_namespace?

  private

  def check_admin
    redirect_to root_path, alert: "Not authorized" unless current_user&.admin?
  end

  def admin_namespace?
    controller_path.split('/').first == "admin"
  end
end
