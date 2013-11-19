class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :do_search]

  def blah
  end

  def dashboard
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def do_search
    @users = User.where("age BETWEEN ? AND ?", params[:start_age], params[:end_age])
    # @users = User.where("looking" => "female", params[:gender])
    # @users = User.where("looking" => "male", params[:gender])
    # @users = User.where("location = ?", location)
  end

  def new_search
  end

  def star
  end

  def unstar
  end

  def poke
  end

  def flag
  end

  def unflag
  end

end
