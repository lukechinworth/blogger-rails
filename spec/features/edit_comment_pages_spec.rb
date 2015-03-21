require 'rails_helper'

describe "the edit a comment process" do
  it "edits a comment" do
    post = Post.create(title: "test", body: "test body")
    comment = post.comments.create(body: "comment text")
    visit post_path(post)
    within("div.comments") do
      click_on 'Edit'
    end
    fill_in 'Body', with: 'comment text (updated)'
    click_on 'Post'
    expect(page).to have_content 'Comment updated'
  end

  it "errors if comment edited to empty string" do
    post = Post.create(title: "test", body: "test body")
    comment = post.comments.create(body: "comment text")
    visit post_path(post)
    within("div.comments") do
      click_on 'Edit'
    end
    fill_in 'Body', with: ''
    click_on 'Post'
    expect(page).to have_content 'Comment failed to update'
  end
end
