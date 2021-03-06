require "rails_helper"

RSpec.feature "Editing Article" do
  before do
    @article = Article.create(title: "My first article", body: "Lorem ipsum")
  end

  scenario "User update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Update Title"
    fill_in "Body", with: "Update Body of Article"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))  
  end

  scenario "A user fail to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Update Body of Article"

    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end