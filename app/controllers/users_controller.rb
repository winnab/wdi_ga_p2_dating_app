class UsersController < Devise::RegistrationsController
  
  before_filter :authenticate_user!, except: [:index, :show]
  
  # user_signed_in? => devise helper
  # user_session => devise helper

  def blah
  end


end