require 'rails_helper'

feature "user adds an item" do
  scenario "as an admin" do
    user = create(:admin)
    sign_in(user.email, user.password)
    visit new_item_path
    fill_in "Name", with: "Thing"
    fill_in "Description", with: "I'm a thing yo!"
    click_button "Submit"

    expect(page).to have_content("Item has been added.")
  end

  scenario "as a non-admin" do
    user = create(:user)
    visit new_item_path

    expect(page).to have_content("Employees Only. Sorry :(")
  end
end
