require 'rails_helper'

describe "the delete a comment process" do

  it "deletes a comment", js: true do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    comment = FactoryGirl.create(:comment, user: user, post: post)
    login_as(user, scope: :user)
    visit post_path(post)
    within 'div#comments' do
      click_on 'Delete'
    end
    expect(page).to have_content 'successfully deleted'
  end
end
