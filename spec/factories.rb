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
    user
  end

  factory :comment do
    body 'body'
    post
    user
  end
end
