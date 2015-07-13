require 'rails_helper'

feature "it lists all of the items" do

  before { create_items }

  scenario "when user is signed out" do
    visit '/'
    expect(page).to have_content("Sign in to claim")
  end

  scenario "when user is signed in" do
    user = create(:user)

    visit '/users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit '/'

    expect(page).to have_content("Claim item")
  end

  def create_items
    5.times { create(:item) }
  end
end
