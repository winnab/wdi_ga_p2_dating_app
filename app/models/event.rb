class Event < ActiveRecord::Base
  attr_accessible :user_id, :target_user_id, :event_type, :created_at

  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :target_user, :class_name => 'User', :foreign_key => 'target_user_id'
end
