require "application_system_test_case"

class MattressesTest < ApplicationSystemTestCase
  setup do
    @mattress = mattresses(:one)
  end

  test "visiting the index" do
    visit mattresses_url
    assert_selector "h1", text: "Mattresses"
  end

  test "should create mattress" do
    visit mattresses_url
    click_on "New mattress"

    fill_in "Shop", with: @mattress.shop_id
    click_on "Create Mattress"

    assert_text "Mattress was successfully created"
    click_on "Back"
  end

  test "should update Mattress" do
    visit mattress_url(@mattress)
    click_on "Edit this mattress", match: :first

    fill_in "Shop", with: @mattress.shop_id
    click_on "Update Mattress"

    assert_text "Mattress was successfully updated"
    click_on "Back"
  end

  test "should destroy Mattress" do
    visit mattress_url(@mattress)
    click_on "Destroy this mattress", match: :first

    assert_text "Mattress was successfully destroyed"
  end
end
