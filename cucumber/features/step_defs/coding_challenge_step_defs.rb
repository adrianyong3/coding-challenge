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
  Todo.add_new( todo_text )
end

Then("edit the todo item from {string} to {string}") do |old_todo, new_todo|
  Todo.edit_todo( old_todo, new_todo)
  expect(page).not_to have_content(old_todo)
  expect(page).to have_content(new_todo)
end

Then("mark the todo item {string} as complete") do |todo_text|
  Todo.complete_todo( todo_text )
  expect(page).to have_css('li.completed')
end

Then("re-activate the completed todo item {string}") do |todo_text|
  Todo.complete_todo( todo_text )
  expect(page).to have_no_css('li.completed')
end

Then("add a second todo called {string}") do |todo_text|
  Todo.add_new( todo_text )
  expect(page).to have_content( todo_text )
end

Then("complete all active todos") do
  Todo.complete_all_active_todos
  total_compeleted = Todo.total_completed_todos
  expect(total_compeleted).to eq 2
  # Clear all todos before finishing the test becuase the app remembers the last session
  Todo.clear_all_completed_todos
  total_todos_displayed = Todo.total_todos_displayed
  expect(total_todos_displayed).to eq 0
end

Given("I have {int} todos") do |total_todos|
  visit('http://todomvc.com/examples/emberjs/')
  total_todos.times do |index|
    Todo.add_new( "todo item #{index}")
  end
  total_todos_displayed = Todo.total_todos_displayed
  expect(total_todos_displayed).to eq total_todos
end

Given("{int} are completed") do |int|
  5.times do |index|
    Todo.complete_todo( "todo item #{index}")
  end
end

When("I filter for completed todos") do
  Todo.filter_completed
end

Then("I should see only {int} todos") do |expected_todos_displayed|
  total_todos_displayed = Todo.total_todos_displayed
  expect(total_todos_displayed).to eq expected_todos_displayed
end

Then("I should be able to clear one of the completed todos") do
  Todo.delete_completed_todo( 'todo item 0')
end

Then("I should be able to clear all of the completed todos") do
  Todo.clear_all_completed_todos
  total_todos_displayed = Todo.total_todos_displayed
  expect(total_todos_displayed).to eq 0
end