require 'rails_helper'

feature "when logged in and browsing items" do
  scenario "user claims item" do
    user = create(:user)
    create(:item)

    sign_in(user.email, user.password)
    visit '/'
    click_link 'Claim item'

    expect(page).to have_content("Congrats, that item is yours!")
  end
end
