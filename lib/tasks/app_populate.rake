require 'factory_girl'

namespace :users do
  desc "Create sample users for demos of site" 
  task :create_sample_users => :environment do
    FactoryGirl.create :female_with_messages, recipient_gender: "Female"
    FactoryGirl.create :female_with_messages, recipient_gender: "Male"
    FactoryGirl.create :male_with_messages, recipient_gender: "Female"
    FactoryGirl.create :male_with_messages, recipient_gender: "Male"
  end

end