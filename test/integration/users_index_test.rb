require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  include Pagy::Method

  def setup
    @admin = users(:michael)
    @non_admin = users(:archer)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template "users/index"
    assert_select "ul.pagination", count: 2
    _, first_page_of_users = pagy(User.all, page: 1)
    first_page_of_users.each do |user|
      assert_select ".card-body", text: /#{Regexp.escape(user.name)}/ do
        assert_select 'a[href=?]', user_path(user), text: 'View Profile'
      end
      unless user == @admin
        assert_select ".card-body" do
          assert_select 'a[href=?]', user_path(user), text: 'Delete User'
        end
      end
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'Delete User', count: 0
  end
end
