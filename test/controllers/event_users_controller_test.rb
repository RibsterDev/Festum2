require 'test_helper'

class EventUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_users_create_url
    assert_response :success
  end

  test "should get new" do
    get event_users_new_url
    assert_response :success
  end

end
