require "rails_helper"

feature "User can recommend links" do
  before do
    visit root_path
  end

  scenario "user recommends link to someone" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    fill_in "link_url", with: "http://espn.com"
    fill_in "link_title", with: "Sports for Me"
    click_button 'Create Link'

    click_link "Recommend Link"

    expect(page).to have_content("http://espn.com")

    fill_in "link_outbound_email", with: "testing@mail.com"
    click_button 'Send Email'

    expect(page).to have_content("Email sent to testing@mail.com")

  end

end
