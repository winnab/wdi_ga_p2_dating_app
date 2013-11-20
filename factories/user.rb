FactoryGirl.define do

  # ff = FactoryGirl.create :female_with_messages, recipient_gender: "Female"
  # fm = FactoryGirl.create :female_with_messages, recipient_gender: "Male"
  # mf = FactoryGirl.create :male_with_messages, recipient_gender: "Female"
  # mm = FactoryGirl.create :male_with_messages, recipient_gender: "Male"
  
  # avatar                  "asdfsdf.jpg"
      
  factory :user, :aliases => [:sender, :recipient, :target_user] do
    sequence(:username)     { |n| "#{first_name.downcase}#{n}" }
    gender                  "Female"
    email                   { "#{username}@mail.com" }
    first_name              { %w(Tracy Abby Joleen Lola Audra Randi Andrea Carrie Nichola Adalyn Coraline Rihanna Raina Uma Bonnie Zoya Dahlia Vera Jada Leia Kerry Lizbeth Janelle Nikita Marian Kim Alka Zaria Jules Abbi Elspeth Mollie Hester Kate Kamryn Elle Adelaide Brenna Jacinda Phoenix Lilac Phillipa Verity Kinsey Rhian).sample }
    last_name               { Faker::Name.last_name } # does not need to be unique. 
    password                "password"
    password_confirmation   { |u| u.password }
    age                     { rand(18..60) }
    tagline                 { Faker::Lorem.sentences(2) }
    bio                     { Faker::Lorem.paragraph(2) }
    location                { %w(London Birmingham Leeds Glasgow Sheffield Liverpool Manchester Bristol Cardiff Coventry Nottingham Leicester Newcastle Brighton Oxford Cambridge).sample }
    plan                    { %w(Standard Premium).sample }

    factory :female do
      sequence(:username)     { |n| "#{first_name.downcase}#{n}" }
      gender      "Female"
      first_name  { %w(Tracy Abby Joleen Lola Audra Randi Andrea Carrie Nichola Adalyn Coraline Rihanna Raina Uma Bonnie Zoya Dahlia Vera Jada Leia Kerry Lizbeth Janelle Nikita Marian Kim Alka Zaria Jules Abbi Elspeth Mollie Hester Kate Kamryn Elle Adelaide Brenna Jacinda Phoenix Lilac Phillipa Verity Kinsey Rhian).sample }
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
        message_count 3
        recipient_gender  "Female" # default -- override by passing
      end
      after(:create) do |user, evaluator|
        msg_factory = case evaluator.recipient_gender
          when "Male" then :message_to_male
          when "Female" then :message_to_female
        end
        FactoryGirl.create_list msg_factory, evaluator.message_count, sender: user
      end
    end

  end
end

