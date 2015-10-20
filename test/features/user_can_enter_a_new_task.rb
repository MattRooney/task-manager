require_relative '../test_helper'

class NewTest < FeatureTest

  def create_tasks(num)
    num.times do |i|
      TaskManager.create({ :title       => "#{i+1} title",
                           :description => "#{i+1} description"})
    end
  end

  def test_user_can_create_a_task
    visit '/'
    click_link "New Task"

    fill_in("task-title", with: "test task")
    fill_in("task-description", with: "new task description")
    assert_equal '/tasks/new', current_path
    click_button('Create Task')
    assert_equal '/tasks', current_path

    # within(".container") do
    #   assert page.has_content?("test task")
    # end
  end


  def test_user_can_see_new_task_form
    skip
    visit '/'
    click_link "New Task"

    assert_equal "/tasks/new", current_path
  end

end
