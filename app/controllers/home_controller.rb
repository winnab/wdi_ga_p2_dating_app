class HomeController < ApplicationController
  
  def index
    if current_user
      redirect_to dashboard_url
    else
      @user = User.new
    end

  end

end
