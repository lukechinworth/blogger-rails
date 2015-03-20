require 'rails_helper'

describe "the delete a post process" do
  it "deletes a post" do
    Post.create(title: "test", body: "test body")
    visit posts_path
    click_on 'test'

    expect(page).to have_content 'successfully deleted'
  end
end
