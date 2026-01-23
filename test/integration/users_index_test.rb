  require "test_helper"

  class UsersIndex < ActionDispatch::IntegrationTest
    include Pagy::Method

    def setup
      @admin     = users(:michael)
      @non_admin = users(:archer)
    end
  end

  class UsersIndexAdmin < UsersIndex

    def setup
      super
      log_in_as(@admin)
      get users_path
    end
  end

  class UsersIndexAdminTest < UsersIndexAdmin

    test "should render the index page" do
      assert_template 'users/index'
    end

    test "should paginate users" do
      assert_select "ul.pagination", count: 2
    end

    test "should have delete links" do
      _, users = pagy(User.where(activated: true), page: 1)
      users.each do |user|
        assert_select '.card-body', text: /#{Regexp.escape(user.name)}/ do
          assert_select 'a[href=?]', user_path(user), text: 'View Profile'
        end
        unless user == @admin
          assert_select '.card-body' do
            assert_select 'a[href=?]', user_path(user), text: 'Delete User'
          end
        end
      end
    end

    test "should be able to delete non-admin user" do
      assert_difference 'User.count', -1 do
        delete user_path(@non_admin)
      end
      assert_response :see_other
      assert_redirected_to users_url
    end

    test "should display only activated users" do
      _, users = pagy(User, page: 1)
      users.first.toggle!(:activated)
      get users_path
      assigns(:users).each do |user|
        assert user.activated?
      end
    end
  end

  class UsersNonAdminIndexTest < UsersIndex

    test "should not have delete links as non-admin" do
      log_in_as(@non_admin)
      get users_path
      assert_select 'a', text: 'Delete User', count: 0
    end
  end
