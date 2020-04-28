require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    check "Available" if @course.available
    fill_in "Course type", with: @course.course_type
    fill_in "Currency", with: @course.currency
    fill_in "Description", with: @course.description
    fill_in "Expire days", with: @course.expire_days
    fill_in "Price", with: @course.price
    fill_in "Start at", with: @course.start_at
    fill_in "Theme", with: @course.theme
    fill_in "Url", with: @course.url
    fill_in "User", with: @course.user_id
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    check "Available" if @course.available
    fill_in "Course type", with: @course.course_type
    fill_in "Currency", with: @course.currency
    fill_in "Description", with: @course.description
    fill_in "Expire days", with: @course.expire_days
    fill_in "Price", with: @course.price
    fill_in "Start at", with: @course.start_at
    fill_in "Theme", with: @course.theme
    fill_in "Url", with: @course.url
    fill_in "User", with: @course.user_id
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
