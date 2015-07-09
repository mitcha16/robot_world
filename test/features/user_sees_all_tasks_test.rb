require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_home_page_displays_welcome_message
    visit("/")
    assert page.has_content?("Welcome to Robot World!")
  end

  def test_user_can_fill_in_task_form
    visit("/")
    click_link("Create a New Robot")
    assert_equal  "/robots/new", current_path
    create
    assert_equal "/robots", current_path
    within(".container") do
      assert page.has_content?("new name")
    end
  end

  def test_user_can_edit_a_task
    visit("/")
    click_link("Create a New Robot")
    assert_equal  "/robots/new", current_path
    create
    visit("/robots")
    click_link("edit")
    assert_equal "/robots/1/edit", current_path
    fill_in("robot[name]", with: "Mitch")
    click_button("Update Your Robot!")
    visit("/robots")
    within(".container") do
      assert page.has_content?("Mitch")
    end
  end


  def test_user_can_delete_a_robot
    visit("/")
    click_link("Create a New Robot")
    assert_equal  "/robots/new", current_path
    create
    visit("/robots")
    click_button("delete")
    assert_equal "/robots", current_path
    within(".container") do
      refute page.has_content?("new name")
    end
  end

  def create
    visit("/robots/new")
    fill_in("name", with: "new name")
    fill_in("city", with: "new city")
    fill_in("birthday", with: "new birth date")
    fill_in("hired", with: "new date hired")
    fill_in("department", with: "new department")
    click_button("Create A Robot!")
  end

end
