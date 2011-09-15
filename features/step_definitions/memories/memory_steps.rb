When /^I activate the new memory switch$/ do
  click_link "New Memory"
end

When /^I fill out the memory form with (.+)$/ do |content|
  fill_in "Content", :with => content
end

When /^I submit the memory form$/ do
  click_button "submit_memory_button"
end