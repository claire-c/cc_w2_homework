require('pry')


class Guest

  attr_reader :name, :fave_song
  attr_accessor :wallet

  def initialize(name, wallet = 0, fave_song = nil)
    @name = name
    @wallet = wallet
    @fave_song = fave_song
  end

  def pay_fee(room_to_pay)
    @wallet -= room_to_pay.fee if @wallet >= room_to_pay.fee
  end

  def fave_song_in_room(room_to_check)
    room_to_check.is_song_in_playlist?(@fave_song) ? "Yus, prepare to hear #{@fave_song.title}!" : "Boo, this playlist sucks"
  end



end
