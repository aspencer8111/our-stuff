require 'rails_helper'

feature "it lists all of the items" do
  scenario "when visiting the index page" do
    5.times {Item.create(name: 'Thing', description: "Its a thing!")}
    visit '/'

    expect(page).to have_content("Items Available")
    expect(page).to have_css("ul")
    expect(page).to have_css("li")
  end
end
