class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :do_search]

  def blah
  end

  def dashboard
    @news_items     = current_user.news_items
    @starred_list   = current_user.get_starred_users
    @views_summary  = current_user.profile_views_count_by_day
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    # Track view if current_user logged in & not viewing own profile
    Event.create(event_type: :view, user_id: current_user.id, target_user_id: @user.id) if (user_signed_in? && current_user.id != @user.id)
  end

  def do_search
    @users = User.all
    @users_search = User.where("(age BETWEEN ? AND ?) AND gender = ? AND location = ?", params[:start_age], params[:end_age], params[:looking_for_gender], params[:location])


    # @users = User.where("age BETWEEN ? AND ?", params[:start_age], params[:end_age])
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
