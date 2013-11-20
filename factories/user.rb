FactoryGirl.define do

# 10 users
  # 5 each gender
    # female first name
    # username as sequence of firstname
    # mail as sequence of firstname
    # mail as sequence of firstname

    # avatar                  "asdfsdf.jpg"
      
  factory :user, :aliases => [:sender, :recipient, :target_user] do
    
    last_name               { Faker::Name.last_name } # does not need to be unique. 
    password                "password"
    password_confirmation   { |u| u.password }
    age                     { rand(18..90) }
    tagline                 { Faker::Lorem.sentences(2) }
    bio                     { Faker::Lorem.paragraph(2) }
    location                { %w(London Birmingham Leeds Glasgow Sheffield Liverpool Manchester Bristol Cardiff Coventry Nottingham Leicester Newcastle Brighton Oxford Cambridge).sample }
    first_name              { %w(Tracy Abby Joleen Lola Audra Randi Andrea Carrie Nichola Adalyn Coraline Rihanna Raina Uma Bonnie Zoya Dahlia Vera Jada Leia Kerry Lizbeth Janelle Nikita Marian Kim Alka Zaria Jules Abbi Elspeth Mollie Hester Kate Kamryn Elle Adelaide Brenna Jacinda Phoenix Lilac Phillipa Verity Kinsey Rhian).sample }
    sequence(:username)     { |n| "#{first_name.downcase}#{n}" }
    gender      "Female"
    email       { "#{username}@mail.com" }

    factory :female do
      first_name  { %w(Tracy Abby Joleen Lola Audra Randi Andrea Carrie Nichola Adalyn Coraline Rihanna Raina Uma Bonnie Zoya Dahlia Vera Jada Leia Kerry Lizbeth Janelle Nikita Marian Kim Alka Zaria Jules Abbi Elspeth Mollie Hester Kate Kamryn Elle Adelaide Brenna Jacinda Phoenix Lilac Phillipa Verity Kinsey Rhian).sample }
      sequence(:username)     { |n| "#{first_name.downcase}#{n}" }
      gender      "Female"
      email       { "#{username}@mail.com" }
      # avatar    "asdfsdf.jpg"
      factory :female_with_messages, traits: [:with_messages]
    end

    factory :male do
      sequence(:username)     { |n| "#{first_name.downcase}#{n}" }
      gender  "Male"
      first_name { %w(Tiger Leuan Byron Ramon Harley Ryker Humphrey Donovan Nash Trevor Pete Brice Andres Gian Melvin Preston Felix Connor Jesse Horatio Zylen Anthony Jesus Gregor Keenan Clancy Karla Doyle Lysander Cormac Ollie Issac Francesco Raphael Ahmed Trenton Carl Reed Louie Gilbert Burton Don Jimmie Horace Yestin Riley Colm Holden).sample }
      email       { "#{username}@mail.com" }      
      # avatar    "asdfsdf.jpg"
      factory :male_with_messages, traits: [:with_messages]      
    end

    trait :with_messages do # pass a gender or it will default to female
      ignore do
        message_count 1
        recipient_gender  "Female"
      end
      after(:create) do |user, evaluator|
        msg_factory = case evaluator.recipient_gender
          when "Male" then :message_to_male
          when "Female" then :message_to_female
        end
        FactoryGirl.create_list msg_factory, evaluator.message_count, sender: user
      end
    end

    factory :premium do
      plan  "Premium" 

    end

    factory :standard do
      plan  "Standard"

    end


  end
end

#<User id: nil, 

# event_tokens: nil, 
# star_count: nil, 
# flag_count: nil, 
# is_locked: nil, 
 
 
# avatar: nil>

# first_name: "Alanna", 
# last_name: "Osinski", 
# username: "username-1", 
# plan: "Standard", 
# age: 42, 
# gender: ["Male"], 
# location: "Leicester", 
# tagline: ["Autem voluptas commodi culpa voluptatem at et.", 
  # "Voluptatem sit consequatur."], 
# bio: "Aut totam ut et accusantium dolor. Sapiente alias d...", 
# email: "Alanna@mail.com", 
# encrypted_password: "$2a$10$Gsua/uUrxNzSQF4AA4gfEetn9lACMTmzR3FXM6v609Ds...",

# reset_password_token: nil, 
# reset_password_sent_at: nil, 
# remember_created_at: nil, 
# sign_in_count: 0, 
# current_sign_in_at: nil, 
# last_sign_in_at: nil, 
# current_sign_in_ip: nil, 
# last_sign_in_ip: nil, 
# confirmation_token: nil, 
# confirmed_at: nil, 
# confirmation_sent_at: nil, 
# created_at: nil, 
# updated_at: nil,
