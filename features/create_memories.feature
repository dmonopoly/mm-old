Feature: create memories

	As a person
	I can create memories
	
	Scenario: navigate to memory creation page
		Given I am on the home page
		And I activate the new memory switch
		Then I should be on the new memory page
		
	