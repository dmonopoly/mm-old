Feature: create memories

	As a person
	I can create memories
	
	Scenario: navigate to memory creation page
		Given I am on the home page
		When I activate the new memory switch
		Then I should be on the new memory page
		
	@now
	Scenario: create memory
		Given I am on the new memory page
		When I fill out the memory form with "I played."
		And I submit the memory form
		Then I should be on the memory page for the memory "I played."
		
	