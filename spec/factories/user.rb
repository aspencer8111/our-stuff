FactoryGirl.define do
  factory :user do
    email 'someone@example.com'
    password 'Password1'
    password_confirmation 'Password1'
  end

  factory :admin, class: User do
    email 'admin@example.com'
    password 'Password1'
    password_confirmation 'Password1'
    admin true
  end
end
