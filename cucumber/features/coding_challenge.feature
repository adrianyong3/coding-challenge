Feature: Coding Challenge

	@navigation
	Scenario: Navigate to Todomvc Ember app
		Given I am on the TodoMVC main page
		When I click on the "Ember.js" link
		Then I should be taken to the Ember.js TodoMVC app

	@main_features
	Scenario: Go through all the features of the todo app 
		Given I am on the Ember.js TodoMVC app
		Then I should be able to add a new todo item called "Buy Pineapples"
		And edit the todo item from "Buy Pineapples" to "Buy Oranges"
		And mark the todo item "Buy Oranges" as complete
		And re-activate the completed todo item "Buy Oranges"
		And add a second todo called "Buy Socks"
		And complete all active todos

	@filter
	Scenario: Filter Todos and clear todos
		Given I have 7 todos
		And 5 are completed 
		When I filter for completed todos
		Then I should see only 5 todos
		And I should be able to clear one of the completed todos
		And I should see only 4 todos
		And I should be able to clear all of the completed todos
