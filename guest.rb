require('pry')

class Guest

  attr_reader :name
  attr_accessor :wallet

  def initialize(name, wallet = 0)
    @name = name
    @wallet = wallet
  end

  def pay_fee(room_to_pay)
    @wallet -= room_to_pay.fee if @wallet >= room_to_pay.fee
  end



end
