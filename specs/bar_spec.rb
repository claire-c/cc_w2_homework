require('minitest/autorun')
require_relative('../bar.rb')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class BarTest < MiniTest::Test

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

    @bar = Bar.new(500)
  end

  def test_get_bar_till()
    assert_equal(500, @bar.till)
  end

  def test_get_bar_orders()
    assert_equal([], @bar.orders)
  end

  # def test_take_order__one_item()
  #   order = {name: "Chips", cost: 3}
  #   result = @bar.take_order(@guest, order)
  #   assert_equal(503, @bar.till)
  #   assert_equal(22, @guest.wallet)
  #   assert_equal(["Chips"], @bar.orders)
  # end

  def test_take_order__multiple_items()
    order = [{name: "Chips", cost: 3},
             {name: "Gin and tonic", cost: 7},
             {name: "Burger", cost: 6}]
    result = @bar.take_order(@guest, order)
    assert_equal(516, @bar.till)
    assert_equal(9, @guest.wallet)
    assert_equal(["Chips", "Gin and tonic", "Burger"], @bar.orders)
  end




end



# Rooms can keep track of the entry fees/spending of the guests - maybe add a bar tab/bar class?
