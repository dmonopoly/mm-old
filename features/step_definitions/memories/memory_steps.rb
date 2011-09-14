When /^I activate the new memory switch$/ do
  click_link "New Memory"
end

When /^I fill out the memory form$/ do
  puts '------------------'
  puts "content: #{Filler::Memory.content}"
  puts '------------------'
  fill_in "Content", :with => Filler::Memory.content
end

When /^I submit the memory form$/ do
  click_button "submit_memory_button"
end