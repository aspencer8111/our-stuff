require "rails_helper"

feature "user signs in" do
  scenario "with good credentials" do
    user = create(:user)

    attempt_login(user)
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "with bad credentials" do
    user = create(:user)
    user.password = ''

    attempt_login(user)
    expect(page).to have_content("Invalid email or password.")
  end

  def attempt_login(user)
    visit '/'
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end
