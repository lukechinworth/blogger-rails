require 'rails_helper'

describe "the add a post process", js: true do
  it "adds a new post" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit posts_path
    click_on 'New post'
    fill_in 'Title', with: 'test post'
    fill_in 'Body', with: 'test body'
    click_on 'Post'
    expect(page).to have_content 'successfully'
  end

  it "fails to add a new post if title or body field left empty" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit posts_path
    click_on 'New post'
    fill_in 'Title', with: 'test post'
    click_on 'Post'
    expect(page).to have_content 'failed'
  end
end
