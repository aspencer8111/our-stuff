feature "user signs up" do
  scenario "with good info" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "person@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
