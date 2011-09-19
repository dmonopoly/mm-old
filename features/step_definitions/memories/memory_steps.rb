When /^I activate the new memory switch$/ do
  click_link "New Memory"
end

When /^I activate the edit memory switch for the memory "(.+)"$/ do |content|
  # memory = Memory.find_by_content(content)
  within(".memory") do # How do I specify content? - UNRESOLVED
    click_link "Alter"
  end
end

When /^I fill out the memory form with "(.+)"$/ do |content|
  fill_in "Content", :with => content
end

When /^I submit the memory form$/ do
  click_button "submit_memory_button"
end