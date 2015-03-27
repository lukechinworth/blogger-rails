FactoryGirl.define do
  factory :user do
    username 'username'
    email 'username@mail.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    title 'title'
    body 'body'
  end

  factory :comment do
    body 'body'
  end
end
