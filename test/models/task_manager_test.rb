require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_task_is_created
    TaskManager.create({ :title       => "My title",
                         :description => "get stuff done"})
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "My title", task.title
    assert_equal "get stuff done", task.description
  end

  def test_it_has_two_tasks
    TaskManager.create({ :title       => "Title",
                         :description => "continue getting stuff done"})
    TaskManager.create({ :title       => "Title 2",
                         :description => "getting stuff done again"})
    task_one = TaskManager.find(1)
    task_two = TaskManager.find(2)

    assert_equal 1, task_one.id
    assert_equal "Title", task_one.title
    assert_equal "continue getting stuff done", task_one.description

    assert_equal 2, task_two.id
    assert_equal "Title 2", task_two.title
    assert_equal "getting stuff done again", task_two.description
  end

  def test_all_returns_two_tasks
    TaskManager.create({ :title       => "Title",
                         :description => "continue getting stuff done"})
    TaskManager.create({ :title       => "Title 2",
                         :description => "getting stuff done again"})

    assert_equal ["Title", "Title 2"], TaskManager.all.map { |task| task.title }
  end

  def test_all_returns_three_tasks
    TaskManager.create({ :title       => "Title",
                         :description => "continue getting stuff done"})
    TaskManager.create({ :title       => "Title 2",
                         :description => "getting stuff done again"})
    TaskManager.create({ :title       => "Title 3",
                         :description => "ummm, getting stuff done?"})

    assert_equal ["Title", "Title 2", "Title 3"], TaskManager.all.map { |task| task.title }
  end

  def test_returns_all_tasks
    TaskManager.create({ :title       => "Title",
                         :description => "continue getting stuff done"})
    TaskManager.create({ :title       => "Title 2",
                         :description => "getting stuff done again"})
    TaskManager.create({ :title       => "Title 3",
                         :description => "ummm, getting stuff done?"})
    tasks = TaskManager.all

    assert_equal 3, tasks.count
    assert tasks.all? { |task| task.is_a?(Task) }
  end

  def test_it_finds_id_2
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
    TaskManager.create({ :title       => "Title",
                         :description => "continue getting stuff done"})
    TaskManager.update(1 , {:title   => "Title", :description => "new description"})
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "Title", task.title
    assert_equal "new description", task.description
  end

  def test_it_deletes
    TaskManager.create({ :title   => "Title",
                         :description => "continue getting stuff done"})
    TaskManager.create({ :title   => "Title 2",
                         :description => "getting stuff done again"})
    TaskManager.create({ :title   => "Title 3",
                         :description => "ummm, getting stuff done?"})

    TaskManager.delete(2)

    assert_equal ["Title", "Title 3"], TaskManager.all.map { |task| task.title }
  end
end
