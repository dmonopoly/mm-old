When /^I activate the new memory switch$/ do
  click_link "New Memory"
end

When /^I fill out the memory form$/ do
  fill_in "content", :with => Filler::Memory.content
  fill_in "login", :with => @user.login
  fill_in "password", :with => @user.password
  click_button "login_button"
end