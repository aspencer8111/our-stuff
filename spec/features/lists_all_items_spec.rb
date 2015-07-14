require 'rails_helper'

feature "it lists all of the items" do

  before { create_items }

  scenario "when user is signed out" do
    visit '/'
    expect(page).to have_content("Sign in to claim")
  end

  scenario "when user is signed in" do
    user = create(:user)
    sign_in(user.email, user.password)
    visit '/'

    expect(page).to have_selector(:link_or_button, "Claim item")
  end

  def create_items
    5.times { create(:item) }
  end
end
