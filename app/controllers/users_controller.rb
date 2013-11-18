class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def blah
  end

  def dashboard
    @news_items = current_user.news_items
    @starred_list = current_user.get_starred_users
  end

  def index
  end

  def do_search
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
