require('minitest/autorun')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')


class GuestTest < MiniTest::Test

  def setup()
    blues_song = Song.new("Layla", "Eric Clapton")
    folk_song = Song.new("Blue", "Joni Mitchell")
    pop_song = Song.new("Umbrella", "Rihanna")
    rock_song = Song.new("I Feel Free", "Cream")

    @song = Song.new("Sledgehammer", "Peter Gabriel")

    @playlist = [blues_song, folk_song, pop_song, rock_song]

    claire = Guest.new("Claire")
    ewa = Guest.new("Ewa")
    mike = Guest.new("Mike")
    aileen = Guest.new("Aileen")

    @occupants = [claire, ewa, mike, aileen]
    @guest = Guest.new("Claire", 25, @song)

    @room = Room.new("Karaoke Room", @occupants, @playlist)


  end

  def test_get_guest_name()
    assert_equal("Claire", @guest.name)
  end

  def test_get_guest_wallet()
    simon = Guest.new("Simon")
    assert_equal(25, @guest.wallet)
    assert_equal(0, simon.wallet)
  end

  def test_pay_fee()
    assert_equal(20, @guest.pay_fee(@room))

  end

  def test_pay_fee__not_enough_money()
    skint_guest = Guest.new("Claire")
    assert_nil(skint_guest.pay_fee(@room))
  end

  def test_fave_song_in_room__true()
    @room.add_song(@song)
    result = @guest.fave_song_in_room(@room)
    assert_equal("Yus, prepare to hear Sledgehammer!", result)
  end

  def test_fave_song_in_room__false()
    result = @guest.fave_song_in_room(@room)
    assert_equal("Boo, this playlist sucks", result)
  end



end
