require('minitest/autorun')
require_relative('../song.rb')


class SongTest < MiniTest::Test

  def setup()
    @song = Song.new("Radio Gaga", "Queen")
  end

  def test_get_song_title()
    assert_equal("Radio Gaga", @song.title)
  end

  def test_get_song_artist()
    assert_equal("Queen", @song.artist)
  end


end
