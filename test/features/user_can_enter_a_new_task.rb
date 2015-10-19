require_relative '../test_helper'

class NewTest < FeatureTest

  def test_user_can_create_a_task
    skip

    TaskManager.create(title: "Task title", description: "New task description")

    visit '/tasks'
    click_link "Task title"

    assert_equal "/tasks/1", current_path
  end


  def test_user_can_see_new_task_form
    skip
    visit '/'
    click_link "New Task"

    assert_equal "/tasks/new", current_path
  end

end
