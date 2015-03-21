require 'rails_helper'

describe "the show a post process" do
  it "shows a post" do
    Post.create(title: "test post", body: "test body")
    visit posts_path
    click_on 'test post'
    expect(page).to have_content 'test body'
  end
end
