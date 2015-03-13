require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:sam)
    @micropost = @user.microposts.build(title: "micropost", content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "title should be present" do  
    @micropost.title = nil
    assert_not @micropost.valid?
  end

  test "content should be present " do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

end
