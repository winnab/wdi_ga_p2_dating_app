class Quality < ActiveRecord::Base
  attr_accessible :user_id, :scope, :type, :value, :created_at
end
