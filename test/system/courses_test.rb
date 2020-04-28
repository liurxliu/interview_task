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
    fill_in "Currency", with: @course.currency
    fill_in "Description", with: @course.description
    fill_in "End at", with: @course.end_at
    fill_in "Price", with: @course.price
    fill_in "Theme", with: @course.theme
    fill_in "Type", with: @course.type
    fill_in "Url", with: @course.url
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    check "Available" if @course.available
    fill_in "Currency", with: @course.currency
    fill_in "Description", with: @course.description
    fill_in "End at", with: @course.end_at
    fill_in "Price", with: @course.price
    fill_in "Theme", with: @course.theme
    fill_in "Type", with: @course.type
    fill_in "Url", with: @course.url
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
