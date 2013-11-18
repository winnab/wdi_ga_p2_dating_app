class Devise::RegistrationsController < DeviseController

  skip_before_filter :require_no_authentication

  def edit
    super
  end 

  def update
    super
    # custom here

  end


  # protected
  #   def after_update_path_for(resource)
  #     user_path(resource)
  #   end

  #   def after_sign_up_path_for(resource)
  #     user_path(resource)
  #   end

end