require_relative '../test_helper'

class IndexTest < FeatureTest

  def test_user_can_edit_a_task
    TaskManager.create(title: "New Task", description: "New task description")

    visit '/tasks'
    click_link "Edit"

    assert_equal "/tasks/1/edit", current_path
  end

  def test_user_can_see_a_task
    TaskManager.create(title: "Task title", description: "New task description")

    visit '/tasks'
    click_link "Task title"

    assert_equal "/tasks/1", current_path
  end

  def test_user_can_hold_two_tasks
    TaskManager.create(title: "Task title", description: "New task description")
    TaskManager.create(title: "Task two", description: "Second description")

    visit '/tasks'
    click_link "Task two"

    assert_equal "/tasks/2", current_path
  end
end
