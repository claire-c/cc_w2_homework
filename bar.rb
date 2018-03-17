require('pry')

class Bar

  attr_reader :orders
  attr_accessor :till

  def initialize(till)
    @till = till
    @orders = []
  end

  def take_order(guest_ordering, guest_order)
    guest_order.each do |order|
      @orders << order[:name]
      @till += order[:cost]
      guest_ordering.wallet -= order[:cost]
    end
  end

  def print_orders()
    @orders.each do |order|
      p order
    end
  end

end
