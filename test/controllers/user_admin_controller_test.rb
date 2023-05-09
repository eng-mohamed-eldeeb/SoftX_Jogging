require 'test_helper'

class UserAdminControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get user_admin_create_url
    assert_response :success
  end
end
