require 'rails_helper'

describe "the commenting on a post process" do
  it "adds a new comment to a post" do
    post = Post.create(title: "test", body: "test body")
    visit post_path(post)
    click_on 'Add comment'
    fill_in 'Body', with: 'comment text'
    click_on 'Post'
    expect(page).to have_content 'Comment posted.'
  end

  it "errors if new comment is submitted empty" do
    post = Post.create(title: "test", body: "test body")
    visit post_path(post)
    click_on 'Add comment'
    click_on 'Post'
    expect(page).to have_content 'Comment failed to post.'
  end
end
