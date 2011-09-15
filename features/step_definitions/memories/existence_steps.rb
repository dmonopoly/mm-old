# This file is for steps like "Given the memory ___ exists"
Given /^the memory "(.+)" exists$/ do |content|
  Factory(:memory, :content => content)
end