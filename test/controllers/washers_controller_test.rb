require 'test_helper'

class WashersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get washers_show_url
    assert_response :success
  end

end
