require 'rails_helper'

describe "the show a post process" do
  it "shows a post" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: 'username@mail.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on 'title'
    expect(page).to have_content 'body'
  end
end
