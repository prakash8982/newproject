require 'test_helper'

class PstaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pstaff = pstaffs(:one)
  end

  test "should get index" do
    get pstaffs_url
    assert_response :success
  end

  test "should get new" do
    get new_pstaff_url
    assert_response :success
  end

  test "should create pstaff" do
    assert_difference('Pstaff.count') do
      post pstaffs_url, params: { pstaff: { aadhaar_card: @pstaff.aadhaar_card, address: @pstaff.address, department: @pstaff.department, gender: @pstaff.gender, mobile_no: @pstaff.mobile_no, name: @pstaff.name, registration_certificate: @pstaff.registration_certificate, vehical_type: @pstaff.vehical_type } }
    end

    assert_redirected_to pstaff_url(Pstaff.last)
  end

  test "should show pstaff" do
    get pstaff_url(@pstaff)
    assert_response :success
  end

  test "should get edit" do
    get edit_pstaff_url(@pstaff)
    assert_response :success
  end

  test "should update pstaff" do
    patch pstaff_url(@pstaff), params: { pstaff: { aadhaar_card: @pstaff.aadhaar_card, address: @pstaff.address, department: @pstaff.department, gender: @pstaff.gender, mobile_no: @pstaff.mobile_no, name: @pstaff.name, registration_certificate: @pstaff.registration_certificate, vehical_type: @pstaff.vehical_type } }
    assert_redirected_to pstaff_url(@pstaff)
  end

  test "should destroy pstaff" do
    assert_difference('Pstaff.count', -1) do
      delete pstaff_url(@pstaff)
    end

    assert_redirected_to pstaffs_url
  end
end
