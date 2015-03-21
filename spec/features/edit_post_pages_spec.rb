require 'rails_helper'

describe "the edit a post process" do
  post = Post.create(title: "test", body: "test body")
  
  it "edits a post" do
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Body', with: 'test body (updated)'
    click_on 'Post'
    expect(page).to have_content 'successfully updated'
  end

  it "errors if a post element is changed to an empty string" do
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Body', with: ''
    click_on 'Post'
    expect(page).to have_content 'failed to be updated'
  end
end
