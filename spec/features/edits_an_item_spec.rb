require 'rails_helper'

feature "user edits an item" do
  scenario "as an admin" do
    user = create(:admin)
    item = create(:item)

    sign_in(user.email, user.password)
    visit edit_item_path(item)
    fill_in "Name", with: "A different thing"
    fill_in "Description", with: "I'm a different thing yo!"
    click_button "Submit"

    expect(page).to have_content("Item has been updated")
  end

  scenario "as a non-admin" do
    user = create(:user)
    item = create(:item)
    visit edit_item_path(item)

    expect(page).to have_content("Employees Only. Sorry :(")
  end
end
