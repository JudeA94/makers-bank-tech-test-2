require 'date'

class Transaction
  def initialize(type, amount, balance)
    @date = DateTime.now.strftime('%m/%d/%Y')
    @type = type
    @amount = amount
    @balance = balance
  end

  attr_reader :date, :type, :amount, :balance
end
