require "rails_helper"

feature "user signs in" do
  scenario "with good credentials" do
    user = create(:user)
    
    visit '/'
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end
end
