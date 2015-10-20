require_relative '../test_helper'

class IndexTest < FeatureTest
  def create_tasks(num)
    num.times do |i|
      TaskManager.create({ :title       => "#{i+1} title",
                           :description => "#{i+1} description"})
    end
  end

  def test_user_can_edit_a_task
    create_tasks(1)
    task = TaskManager.all.last
    visit "/tasks"
    click_link("Edit")

    assert_equal "/tasks/#{task.id}", current_path
  end

  def test_user_can_see_a_task
    skip

    TaskManager.create(title: "Task title", description: "New task description")

    visit '/tasks'
    click_link "Task title"

    assert_equal "/tasks/1", current_path
  end

  def test_user_can_hold_two_tasks
    skip

    TaskManager.create(title: "Task title", description: "New task description")
    TaskManager.create(title: "Task two", description: "Second description")

    visit '/tasks'
    click_link "Task two"

    assert_equal "/tasks/2", current_path
  end
end
