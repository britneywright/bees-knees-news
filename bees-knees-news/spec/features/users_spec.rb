require 'rails_helper'

feature 'Sign Up' do
  scenario "user signs up" do
    visit "/"
    click_link "login"
    find(".signup_form").fill_in "Username", with: "janedog"
    find(".signup_form").fill_in "Password", with: "janedog"
    click_button "Sign Up"
    expect(page).to have_content "janedog"
  end
end
