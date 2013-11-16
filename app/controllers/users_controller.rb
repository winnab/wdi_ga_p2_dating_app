class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  # user_signed_in? => devise helper
  # user_session => devise helper

  def blah
  end


end