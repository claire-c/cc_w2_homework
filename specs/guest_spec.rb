require('minitest/autorun')
require_relative('../guest.rb')


class GuestTest < MiniTest::Test

  def setup()
    @guest = Guest.new("Claire")
  end

  def test_get_guest_name()
    assert_equal("Claire", @guest.name)
  end

end
