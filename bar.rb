require('pry')

class Bar

  attr_reader :orders
  attr_accessor :till

  def initialize(till)
    @till = till
    @orders = []
  end

  def take_order(guest_ordering, guest_order)
    @orders << guest_order[:name]
    guest_ordering.wallet -= guest_order[:cost]
    @till += guest_order[:cost]
  end


end
