class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :username, :plan,
  :age, :gender, :location, :tagline, :bio, :email,
  :password, :password_confirmation, :remember_me, :confirmed_at
  # attr_accessible :title, :body

  has_many  :qualities
  has_many :event_creator, :class_name => 'Event', :foreign_key => 'user_id'
  has_many :event_target, :class_name => 'Event', :foreign_key => 'target_user_id'

  # MESSAGES
  has_many :messages_sent, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :messages_received, :class_name => 'Message', :foreign_key => 'recipient_id'

  def all_messages
    [self.messages_sent, self.messages_received].flatten
  end

  def messages_with_user other_user_id
    sent     = self.messages_sent.where("recipient_id = ?", other_user_id)
    received = self.messages_received.where("sender_id = ?", other_user_id)
    [sent, received].flatten.sort_by(&:created_at)
  end

  def contact_list
    User.find_all_by_id [users_contacted, users_contacted_by]
  end

  def users_contacted
    self.messages_sent.pluck(:recipient_id)   # Returns ids of users has user has sent messages to
  end

  def users_contacted_by
    self.messages_received.pluck(:sender_id)  # Returns ids of users who've messaged this user
  end

  # EVENTS
  # event_type: view | star | poke | flag
  def get_starred_users
    starred_ids = Event.stars.where("user_id = ?", self.id).pluck(:target_user_id)
    User.find_all_by_id(starred_ids)
  end

  def pokes_received
    User.joins(:event_creator).where("events.target_user_id = ? and events.event_type = 'poke'", self.id).select("users.id, users.username, event_type, events.created_at")
  end

  def profile_views days_back=7
    Event.views.where("target_user_id = ? AND created_at > ?", self.id, DateTime.now - days_back.days)
  end

  def profile_views_count_by_day days_back=7
    Event.views.count(:conditions => ["target_user_id = ? AND created_at > ?", self.id, DateTime.now - days_back.days], :group => "DATE(created_at)", :order => "DATE(created_at) DESC")
  end

  # DASHBOARD
  def news_items
    [self.messages_received, self.pokes_received].flatten.sort_by(&:created_at)
  end

end
