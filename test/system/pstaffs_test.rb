require "application_system_test_case"

class PstaffsTest < ApplicationSystemTestCase
  setup do
    @pstaff = pstaffs(:one)
  end

  test "visiting the index" do
    visit pstaffs_url
    assert_selector "h1", text: "Pstaffs"
  end

  test "creating a Pstaff" do
    visit pstaffs_url
    click_on "New Pstaff"

    fill_in "Aadhaar card", with: @pstaff.aadhaar_card
    fill_in "Address", with: @pstaff.address
    fill_in "Department", with: @pstaff.department
    fill_in "Gender", with: @pstaff.gender
    fill_in "Mobile no", with: @pstaff.mobile_no
    fill_in "Name", with: @pstaff.name
    fill_in "Registration certificate", with: @pstaff.registration_certificate
    fill_in "Vehical type", with: @pstaff.vehical_type
    click_on "Create Pstaff"

    assert_text "Pstaff was successfully created"
    click_on "Back"
  end

  test "updating a Pstaff" do
    visit pstaffs_url
    click_on "Edit", match: :first

    fill_in "Aadhaar card", with: @pstaff.aadhaar_card
    fill_in "Address", with: @pstaff.address
    fill_in "Department", with: @pstaff.department
    fill_in "Gender", with: @pstaff.gender
    fill_in "Mobile no", with: @pstaff.mobile_no
    fill_in "Name", with: @pstaff.name
    fill_in "Registration certificate", with: @pstaff.registration_certificate
    fill_in "Vehical type", with: @pstaff.vehical_type
    click_on "Update Pstaff"

    assert_text "Pstaff was successfully updated"
    click_on "Back"
  end

  test "destroying a Pstaff" do
    visit pstaffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pstaff was successfully destroyed"
  end
end
