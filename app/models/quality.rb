class Quality < ActiveRecord::Base
  attr_accessible :user_id, :scope, :quality_type, :value, :created_at

  belongs_to :user
end
