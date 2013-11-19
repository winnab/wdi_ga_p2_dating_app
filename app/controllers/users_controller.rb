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
    @users = User.where("age BETWEEN ? AND ?", params[:start_age], params[:end_age])
    # @users = User.where("looking" => "female", params[:gender])
    # @users = User.where("looking" => "male", params[:gender])
    # @users = User.where("location = ?", location)
  end

  def new_search
  end

  def star
    Event.stars.create(user_id: current_user.id, target_user_id: params[:id])
    if request.xhr? 
      render :partial => 'unstar_btn', locals: {:user_id => params[:id]}
    else
      redirect_to user_path params[:id]
    end
  end

  def unstar
    Event.stars.where(user_id: current_user.id, target_user_id: params[:id]).destroy_all
    if request.xhr? 
      render :partial => 'star_btn', locals: {:user_id => params[:id]}
    else
      redirect_to user_path params[:id]
    end
  end

  def poke
    Event.pokes.create(user_id: current_user.id, target_user_id: params[:id])
    if request.xhr? 
      render :partial => 'poke_done', locals: {:user_id => params[:id]}
    else
      redirect_to user_path params[:id]
    end
  end

  def flag
    Event.flags.create(user_id: current_user.id, target_user_id: params[:id])
    if request.xhr? 
      render :partial => 'unflag_btn', locals: {:user_id => params[:id]}
    else
      redirect_to user_path params[:id]
    end
  end

  def unflag
    Event.flags.where(user_id: current_user.id, target_user_id: params[:id]).destroy_all
    if request.xhr? 
      render :partial => 'flag_btn', locals: {:user_id => params[:id]}
    else
      redirect_to user_path params[:id]
    end
  end

end
