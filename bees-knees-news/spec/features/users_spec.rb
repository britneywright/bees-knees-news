require 'rails_helper'


feature 'Sign Up' do
  let!(:user) {User.create(username: 'janedog', password: 'janedog')}
  scenario "user signs up" do
    visit "/"
    click_link "login"
    find(".signup_form").fill_in "Username", with: user.username
    find(".signup_form").fill_in "Password", with: user.password
    click_button "Sign Up"
    expect(page).to have_content "janedog"
  end
end

feature 'Log In' do
  let!(:user) {User.create(username: 'britney', password: 'britney')}
  scenario "user logs in" do
    login user
    expect(page).to have_content user.username
  end
end

feature 'Profile page' do
  let!(:user) {User.create(username: 'britney', password: 'britney')}
  scenario "own profile" do
    login user
    expect(page).to have_link "submissions"
    expect(page).to have_link "comments"
  end

  scenario "other user's profile" do
    login user
    expect(page).to have_link "submissions"
    expect(page).to have_link "comments"
  end
end
