class Admin::DashboardController < ApplicationController
  before_action :authenticate_user! #모든 사용자 인증 필요
  before_action :authorize_admin! #관리자 권한 확인

  def index
  end

  private

  def authorize_admin!
    unless current_user.admin?
      redirect_to(root_path, alert: 'Access restricted to administrators only.')
    end
  end
end
