class UsersController < Devise::RegistrationsController
  before_filter :authenticate_user!, except: [:index, :show]

  def blah
  end

  def dashboard
  end

end
