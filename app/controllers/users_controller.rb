class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def blah
  end

  def dashboard
  end

  def index
  end
  
end
