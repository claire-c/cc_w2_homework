require('pry')

class Room

attr_reader :name, :occupants, :playlist
attr_accessor :fee, :till

  def initialize(name, occupants, playlist)
    @name = name
    @occupants = occupants
    @playlist = playlist
    @capacity = 6
    @fee = 5
    @till = 0
  end

  def count_playlist()
    @playlist.count()
  end

  def add_song(song_to_add)
    @playlist << song_to_add
  end

  def count_occupants()
    @occupants.count()
  end

  def add_guest(guest_to_add)
     if @occupants.count < @capacity && guest_to_add.wallet >= @fee
       @occupants << guest_to_add
       @till += @fee
     end
  end

  def remove_any_guest()
    @occupants.pop()
  end

  def get_occupants_names()
    names = @occupants.map { |occupant| occupant.name}
    return names
  end

  def is_guest_in_room?(guest_to_check)
    names = @occupants.map { |occupant| occupant.name }
    names.include?(guest_to_check.name)
  end

  def remove_guest(guest_to_remove)
    for occupant in @occupants
      if occupant.name == guest_to_remove.name
        @occupants.delete(occupant)
      end
    end
  end

  def is_room_full?()
    @occupants.count >= @capacity
  end

end
