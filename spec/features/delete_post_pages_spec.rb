require 'rails_helper'

describe "the delete a post process" do
  it "deletes a post", js: true do
    post = FactoryGirl.create(:post)
    login_as(post.user, scope: :user)
    visit posts_path
    click_on 'title'
    click_on 'Delete'
    expect(page).to have_content 'successfully deleted'
  end
end
