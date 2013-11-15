class Event < ActiveRecord::Base
  attr_accessible :user_id, :target_user_id, :type, :created_at
end
