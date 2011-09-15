Feature: update memories

	As a person
	I can update memories
	
	Background:
		Given the memory "I played" exists
	
	@now
	Scenario: navigate to memory update page from home page
		Given I am on the home page
		When I activate the edit memory switch for the memory "I played"
		Then I should be on the edit memory page for the memory "I played"
	
	@wip
	Scenario: update memory
		Given I am on the edit memory page
		When I fill out the memory form with "I ran."
		And I submit the memory form
		Then I should be on the memory page for the memory "I ran."