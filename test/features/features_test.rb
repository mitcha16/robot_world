require_relative '../test_helper'

class Robots_Feature_Test < FeatureTest

  def test_home_page_displays_welcome_message
    visit("/")
    assert page.has_content?("Welcome to Robot World!")
  end

  def test_user_can_fill_in_new_form
    visit("/")
    click_link("Create a New Robot")
    assert_equal  "/robots/new", current_path
    create
    visit("/robots")
    within(".container") do
      assert page.has_content?("a name")
    end
  end

  def test_user_can_edit_a_robot
    create
    visit("/robots")
    click_link("edit")
    fill_in("robot[name]", with: "Mitch")
    click_button("Update Your Robot!")
    visit("/robots")
    within(".container") do
      assert page.has_content?("Mitch")
    end
  end


  def test_user_can_delete_a_robot
    create
    visit("/robots")
    click_button("delete")
    assert_equal "/robots", current_path
    within(".container") do
      refute page.has_content?("new name")
    end
  end

  def create
    RobotDirectory.create({:name => "a name",
      :city => "a city",
      :state => "a state",
      :avatar => "an avatar",
      :department => "a department",
      :birthday => "a birthday",
      :hired => "hired"})
  end

end
