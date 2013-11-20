class UsersController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show, :do_search]
  authorize_resource

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
    @new_message = Message.new(recipient_id: params[:id])
    @new_message.sender_id = current_user.id || 0

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
    @users = User.all
    page = params[:page] || 1
    per_page = 9
    @users = User.paginate(page: page, per_page: per_page).order('created_at').all
  end

  def do_event
    # Whitelist action & event_type params
    event_type   = (['poke', 'star', 'view', 'flag'].include? params[:event_type]) ? params[:event_type] : 'view' #fallback
    event_action = (params[:event_action] == 'set') ? 'set' : 'unset'

    if event_action == 'unset'
      Event.where(event_type: event_type, user_id: current_user.id, target_user_id: params[:id]).destroy_all
    else # set
      Event.create(event_type: event_type, user_id: current_user.id, target_user_id: params[:id])
    end

    if request.xhr?
      case
        when event_type == 'star' && event_action == 'set'   then render :partial => 'unstar_btn', locals: {:user_id => params[:id]}
        when event_type == 'star' && event_action == 'unset' then render :partial => 'star_btn',   locals: {:user_id => params[:id]}
        when event_type == 'flag' && event_action == 'set'   then render :partial => 'unflag_btn', locals: {:user_id => params[:id]}
        when event_type == 'flag' && event_action == 'unset' then render :partial => 'flag_btn',   locals: {:user_id => params[:id]}
        when event_type == 'poke' && event_action == 'set'   then render :partial => 'poke_done',  locals: {:user_id => params[:id]}
        else redirect_to user_path params[:id]
      end
    else
      redirect_to user_path params[:id]
    end
  end

end
