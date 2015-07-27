require 'rails_helper'

feature 'Sign Up' do
  scenario "user signs up" do
    visit "/"
    click_link "login"
    find(".signup_form").fill_in "Username", with: "janedog"
    find(".signup_form").fill_in "Password", with: "janedog"
    expect(page).to have_content "janedog"
  end
end

feature 'Log In' do
  let!(:user) {User.create(username: 'britney', password: 'britney')}

  scenario "user logs in" do
    visit "/"
    click_link "login"
    find(".login_form").fill_in "Username", with: user.username
    find(".login_form").fill_in "Password", with: user.password
    click_button "Login"
    expect(page).to have_content user.username
  end
end
