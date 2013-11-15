class Message < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :content,
  :is_read, :is_archived, :created_at

  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'
end
