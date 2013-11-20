FactoryGirl.define do

  factory :message do
    #attributes
    content { Faker::Lorem.paragraph(1) }
    # associations
    sender
    recipient

    factory :message_to_female do
      association :recipient, factory: :female
    end

    factory :message_to_male do
      association :recipient, factory: :male
    end

  end


  # trait :with_users do
  #   ignore do
  #     sender 2
  #   end
  #   after(:create) do |user, evaluator|
  #     FactoryGirl.create_list :female, evaluator.message_count, sender: user
  #   end
  # end


end



# For a model that has named associations, you can add an alias to a factory. For instance, consider a private message model that has a sender and recipient association for the user table

  # belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  # belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'

# class Message < ActiveRecord::Base
#   belongs_to :sender, :class_name => "User",
#              :foreign_key => 'sender_id'
#   belongs_to :recipient, :class_name => "User",
#              :foreign_key => 'recipient_id'
# end

# FactoryGirl.define do
#   factory :user, :aliases => [:sender, :recipient] do
#     username
#     password 'secret'
#     password_confirmation { |u| u.password }
#   end
# end
# Which then could be used as:

# FactoryGirl.define do
#   factory :message do
#     sender
#     recipient
#   end
# end
