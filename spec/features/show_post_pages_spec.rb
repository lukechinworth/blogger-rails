require 'rails_helper'

describe "the show a post process" do
  it "shows a post" do
    post = FactoryGirl.create(:post)
    login_as(post.user, :scope => :user)
    visit posts_path
    click_on 'title'
    expect(page).to have_content 'body'
  end
end
