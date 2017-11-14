module Todo extend self
	extend Capybara::DSL

	def todo_text_field
		find('#new-todo')
	end

	def add_new( todo_text )
		todo_text_field.set todo_text
		todo_text_field.native.send_keys(:enter)
	end

	def edit_todo( old_todo_text, new_todo_text )
		find(:xpath, "//label[text()='#{old_todo_text}']").double_click	
		find('.edit').set(new_todo_text)
		find('.edit').native.send_keys(:enter)
	end

	def complete_todo( todo_text )
		find(:xpath, "//label[text()='#{todo_text}']/../input").click
	end

	def complete_all_active_todos
		find('#toggle-all').click
	end

	def total_completed_todos
		all('li.completed').size
	end

  def filter_completed
  	click_link('Completed')
  end

  def total_todos_displayed
  	all('#main li').size
  end

  def delete_completed_todo( todo_text )
  	find(:xpath, "//label[text()='#{todo_text}']").hover
  	find(:xpath, "//label[text()='#{todo_text}']/../button").click
  end

  def clear_all_completed_todos
  	find('#clear-completed').click
  end
end