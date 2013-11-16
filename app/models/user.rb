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
    # foreign_key only seaches only column
    # has_many :messages, :foreign_key => 'sender_id'
  def all_messages
    sent     = Message.where("sender_id = ?", self.id)
    received = Message.where("recipient_id = ?", self.id)
    [sent, received].flatten 
  end

  def messages_with_user other_user_id
    sent     = Message.where("sender_id = ? AND recipient_id = ?", self.id, other_user_id)
    received = Message.where("recipient_id = ? AND sender_id = ?", self.id, other_user_id)
    [sent, received].flatten # need to reorder these interweave sent/recd messages in natural sequence
  end

  # EVENTS
  # event_type: view | star | poke | flag
  def get_starred_users
    starred_ids = Event.where("user_id = ? AND event_type = 'star'", self.id).pluck(:target_user_id)
    User.find_all_by_id(starred_ids)
  end

  def pokes_received
    User.joins(:event_creator).where("events.target_user_id = ? and events.event_type = 'poke'", self.id).select("users.id, users.first_name, users.last_name, event_type, events.created_at")
  end
end
