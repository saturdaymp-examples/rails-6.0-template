# typed: false

require "test_helper"

class HomeControllerTests < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url

    assert_response :success
  end
end
