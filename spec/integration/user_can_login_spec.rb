require "rails_helper"

feature "User can view home page and login to see links" do
  before do
    link = Link.create(
        url: "https://cnn.com",
        title: "CNN"
    )

    visit root_path
  end

  scenario "user successfully creates account" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    expect(page).to have_content("My Links")
    expect(page).to have_content("Create a Link")
    expect(page).to have_content("Log Out")
  end

  scenario "user unsuccessfully creates account" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "asldfjasfd"
    click_button 'Create User'

    expect(page).to have_content("Invalid input - Please try creating user again")
    expect(page).to have_content("Password")
  end

  scenario "user successfully creates account, logs out and logs back in" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    expect(page).to have_content("My Links")
    expect(page).to have_content("Create a Link")
    expect(page).to have_content("Log Out")

    click_link "Log Out"

    expect(current_path).to eq(root_path)

    click_link "Log In"
    fill_in "session_email", with: "test@email.com"
    fill_in "session_password", with: "password"
    click_button 'Login'

    expect(page).to have_content("My Links")
    expect(page).to have_content("Create a Link")
    expect(page).to have_content("Log Out")

  end

  scenario "user successfully creates account, logs out and unsuccessfully logs back in" do

    click_link "Sign Up"
    fill_in "email", with: "test@email.com"
    fill_in "password", with: "password"
    fill_in "password-confirmation", with: "password"
    click_button 'Create User'

    expect(page).to have_content("My Links")
    expect(page).to have_content("Create a Link")
    expect(page).to have_content("Log Out")

    click_link "Log Out"

    expect(current_path).to eq(root_path)

    click_link "Log In"
    fill_in "session_email", with: "test@email.com"
    fill_in "session_password", with: "as;ldfkja"
    click_button 'Login'

    expect(page).to have_content("Invalid input - Please try logging in again")

  end


end
