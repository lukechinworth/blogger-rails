require 'rails_helper'

describe "the delete a post process" do
  Post.create(title: "test post for deletion", body: "test body")
  it "deletes a post", js: true do
    visit posts_path
    click_on 'test post for deletion'
    accept_confirm do
      click_on 'Delete'
    end
    expect(page).to have_content 'successfully deleted'
  end
end
