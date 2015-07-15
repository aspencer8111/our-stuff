require 'rails_helper'

feature "when logged in and browsing items" do
  scenario "user claims item" do
    user = create(:user)
    create(:item)

    sign_in(user.email, user.password)
    visit '/'
    click_button 'Claim item'

    expect(page).to have_content("Item has been updated")
  end
end
