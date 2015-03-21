require 'rails_helper'

describe "the delete a comment process" do
  post = Post.create(title: "test", body: "test body")
  comment = post.comments.create(body: "comment text")

  it "deletes a comment", js: true do
    visit post_path(post)
    accept_confirm do
      within 'div.comments' do
        click_on 'Delete'
      end
    end
    expect(page).to have_content 'successfully deleted'
  end
end
