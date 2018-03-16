require('minitest/autorun')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')


class RoomTest < MiniTest::Test

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

    @guest = Guest.new("Lewis")

    @occupants = [claire, ewa, mike, aileen]

    @room = Room.new("Karaoke Room", @occupants, @playlist)
  end

  def test_get_room_name()
    assert_equal("Karaoke Room", @room.name)
  end

  def test_get_room_occupants()
    assert_equal(@occupants, @room.occupants)
  end

  def test_get_room_playlist()
    assert_equal(@playlist, @room.playlist)
  end

  def test_count_playlist()
    assert_equal(4, @room.count_playlist)
  end

  def test_count_playlist__no_songs()
    room = Room.new("Karaoke Room", @occupants, [])
    assert_equal(0, room.count_playlist)
  end

  def test_add_song()
    @room.add_song(@song)
    assert_equal(5, @room.count_playlist)
  end

  def test_count_occupants()
    assert_equal(4, @room.count_occupants)
  end

  def test_count_occupants__empty()
    room = Room.new("Karaoke Room", [], @playlist)
    assert_equal(0, room.count_occupants)
  end

  def test_add_guest()
    @room.add_guest(@guest)
    assert_equal(5, @room.count_occupants)
  end

  def test_remove_any_guest()
    @room.remove_any_guest
    assert_equal(3, @room.count_occupants)
  end

  def test_get_occupants_names()
    names_array = ["Claire", "Ewa", "Mike", "Aileen"]
    result = @room.get_occupants_names()
    assert_equal(names_array, result)
  end

  def test_is_guest_in_room__false()
    result = @room.is_guest_in_room?(@guest)
    assert_equal(false, result)
  end

  def test_is_guest_in_room__true()
    claire = Guest.new("Claire")
    result = @room.is_guest_in_room?(claire)
    assert_equal(true, result)
  end

  def test_remove_guest()
    claire = Guest.new("Claire")
    @room.remove_guest(claire)
    assert_equal(3, @room.count_occupants)
  end

  def test_remove_guest__but_not_in_room()
    @room.remove_guest(@guest)
    assert_equal(4, @room.count_occupants)
  end

  # Check out guests from rooms


end
