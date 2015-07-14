require "rails_helper"

feature "user signs in" do
  scenario "with good credentials" do
    user = create(:user)

    sign_in(user.email, user.password)
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "with bad credentials" do
    user = create(:user)
    user.password = ''

    sign_in("", "")
    expect(page).to have_content("Invalid email or password.")
  end
end
