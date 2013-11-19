module ApplicationHelper

  def location_list
    @users = User.find(params[:location])
  end

end
