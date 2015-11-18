require "rails_helper"

feature "User can view home page and login to see links" do
  before do
    visit root_path
  end

  scenario "user successfully creates link" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    fill_in "link_url", with: "http://espn.com"
    fill_in "link_title", with: "Sports for Me"
    click_button 'Create Link'

    expect(page).to have_content("http://espn.com")
    expect(page).to have_content("Sports for Me")
    expect(page).to have_content("Mark as Read")

  end

  scenario "user unsuccessfully creates link" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    fill_in "link_url", with: "espn.com"
    fill_in "link_title", with: "Sports for Me"
    click_button 'Create Link'

    expect(page).to have_content("Invalid URL")
    expect(page).not_to have_content("http://espn.com")
    expect(page).not_to have_content("Sports for Me")
    expect(page).not_to have_content("Mark as Read")

  end

  scenario "user successfully creates link and marks as read and unread" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    fill_in "link_url", with: "http://espn.com"
    fill_in "link_title", with: "Sports for Me"
    click_button 'Create Link'

    expect(page).to have_content("http://espn.com")
    expect(page).to have_content("Sports for Me")
    expect(page).to have_content("Mark as Read")

    click_link "Mark as Read"

    expect(page).to have_content("Mark as Unread")

    click_link "Mark as Unread"

    expect(page).to have_content("Mark as Read")


  end

  scenario "user successfully creates link and edits link" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    fill_in "link_url", with: "http://espn.com"
    fill_in "link_title", with: "Sports for Me"
    click_button 'Create Link'

    expect(page).to have_content("http://espn.com")
    expect(page).to have_content("Sports for Me")
    expect(page).to have_content("Mark as Read")

    click_link "Edit"

    fill_in "link_url", with: "http://foxsports.com"
    fill_in "link_title", with: "New Sport Link"

    click_button "Update Link"


    expect(page).to have_content("http://foxsports.com")
    expect(page).to have_content("New Sport Link")
    expect(page).to have_content("Mark as Read")

  end

  scenario "user successfully creates link and unsuccessfully edits link" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    fill_in "link_url", with: "http://espn.com"
    fill_in "link_title", with: "Sports for Me"
    click_button 'Create Link'

    expect(page).to have_content("http://espn.com")
    expect(page).to have_content("Sports for Me")
    expect(page).to have_content("Mark as Read")

    click_link "Edit"

    fill_in "link_url", with: "foxsports.com"
    fill_in "link_title", with: "New Sport Link"

    click_button "Update Link"


    expect(page).to have_content("http://espn.com")
    expect(page).to have_content("Sports for Me")
    expect(page).to have_content("Invalid URL")

  end

  scenario "user can search links" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    fill_in "link_url", with: "http://espn.com"
    fill_in "link_title", with: "Sports for Me"
    click_button 'Create Link'

    expect(page).to have_content("http://espn.com")
    expect(page).to have_content("Sports for Me")
    expect(page).to have_content("Mark as Read")

    fill_in "link_url", with: "http://cnn.com"
    fill_in "link_title", with: "CNN"
    click_button 'Create Link'

    fill_in "search", with: "CNN"
    click_button 'Search Links'

    expect(page).to have_content("http://cnn.com")
    expect(page).to have_content("CNN")
    expect(page).not_to have_content("http://espn.com")
    expect(page).not_to have_content("Sports for Me")

  end

end
