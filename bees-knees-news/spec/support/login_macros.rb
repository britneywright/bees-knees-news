module LoginMacros
  def login(user)
    visit "/"
    click_link "login"
    find(".login_form").fill_in "Username", with: user.username
    find(".login_form").fill_in "Password", with: user.password
    click_button "Login"
  end
end
