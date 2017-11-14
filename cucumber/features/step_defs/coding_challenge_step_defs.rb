Given("I am on the TodoMVC main page") do
  visit('http://todomvc.com/')
end

When("I click on the {string} link") do |emberjs_link|
  click_link emberjs_link
end

Then("I should be taken to the Ember.js TodoMVC app") do
  url = URI.parse(current_url)
  expect(url.inspect.include?'emberjs').to be true
  expect(page).to have_content('todos')
end

Given("I am on the Ember.js TodoMVC app") do
  visit('http://todomvc.com/examples/emberjs/')
end

Then("I should be able to add a new todo item called {string}") do |todo_text|
  pending
end

Then("edit the todo item to {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("mark the todo item as complete") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("re-activate the completed todo") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("add a second todo called {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("complete all active todos") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I have {int} todos") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("{int} are completed") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("{int} are incomplete") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I filter for completed todos") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see only {int} todos") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be able to clear one of the completed todos") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be able to clear all of the completed todos") do
  pending # Write code here that turns the phrase above into concrete actions
end