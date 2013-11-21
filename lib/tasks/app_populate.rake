require 'factory_girl'

namespace :users do
  desc "Create sample users for demos of site" 
  task :create_sample_users => :environment do
    FactoryGirl.create_list :female_with_messages, 5, recipient_gender: "Female"
    FactoryGirl.create_list :female_with_messages, 5, recipient_gender: "Male"
    FactoryGirl.create_list :male_with_messages, 5, recipient_gender: "Female"
    FactoryGirl.create_list :male_with_messages, 5, recipient_gender: "Male"
  end

end