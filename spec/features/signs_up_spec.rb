require 'rails_helper'

feature "user signs up" do
  scenario "with good credentials" do
    sign_up("someone@example.com", "Password1", "Password1")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "with mismatched password" do
    sign_up("someone@example.com", "Password1", "Pass")
    expect(page).to have_content("error prohibited this user from being saved:")
  end
end
