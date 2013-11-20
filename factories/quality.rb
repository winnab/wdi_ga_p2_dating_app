FactoryGirl.define do

  factory :quality do
    # attributes
    scope   { %w(self looking).sample }
    quality_type    "tag"
    value   { %w(Ruby Programming PHP Video Games).sample }

    # associations
    user

  end
end
