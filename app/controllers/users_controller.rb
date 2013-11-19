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
    @users = User.where("(age BETWEEN ? AND ?) AND gender = ? AND location = ?", params[:start_age], params[:end_age], params[:looking_for_gender], params[:location])
    # @users = User.where("gender = ?", params[:looking_for_gender])
    # @users = User.where("location = ?", params[:location])
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
