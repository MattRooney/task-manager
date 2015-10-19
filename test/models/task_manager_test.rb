require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def create_tasks(num)
    num.times do |i|
      TaskManager.create({ :title       => "#{i+1} title",
                           :description => "#{i+1} description"})
    end
  end

  def test_task_is_created
    create_tasks(1)
    task = TaskManager.find(TaskManager.all.first.id)

    assert_equal TaskManager.all.first.id, task.id
    assert_equal "1 title", task.title
    assert_equal "1 description", task.description
  end

  def test_it_has_two_tasks
    create_tasks(2)

    assert_equal 2, TaskManager.all.count
  end

  def test_it_has_two_tasks
    create_tasks(2)

    assert_equal ["1 title", "2 title"], TaskManager.all.map { |task| task.title }
  end

  def test_all_returns_three_tasks
    create_tasks(3)
    assert_equal ["1 title", "2 title", "3 title"], TaskManager.all.map { |task| task.title }
  end

  def test_it_finds_by_id
    skip
    create_tasks(5)
    task = TaskManager.find(TaskManager.all)

    assert_equal "3 title", task.title
  end

  def test_returns_all_tasks
    create_tasks(5)
    tasks = TaskManager.all

    assert_equal 5, tasks.count
    assert tasks.all? { |task| task.is_a?(Task) }
  end

  def test_it_finds_id_2
    skip

    TaskManager.create({ :title       => "Title",
                         :description => "continue getting stuff done"})
    TaskManager.create({ :title       => "Title 2",
                         :description => "getting stuff done again"})
    task_two = TaskManager.find(2)

    assert_equal 2, task_two.id
    assert_equal "Title 2", task_two.title
    assert_equal "getting stuff done again", task_two.description
  end

  def test_it_updates
    create_tasks(1)
    TaskManager.update(TaskManager.all.first.id , {:title   => "New Title", :description => "new description"})
    task = TaskManager.find(TaskManager.all.first.id)

    assert_equal "New Title", task.title
    assert_equal "new description", task.description
  end

  def test_it_deletes
    create_tasks(3)
    total = TaskManager.all.count
    TaskManager.delete(TaskManager.all.first.id)

    assert_equal (total - 1), TaskManager.all.count
  end
end
