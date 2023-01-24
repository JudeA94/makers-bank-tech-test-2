require_relative 'transaction'
require_relative 'statement'

class Account
  def initialize
    @balance = 0
    @transaction_history = []
  end

  attr_reader :transaction_history, :balance

  def deposit(amount)
    @balance += amount
    deposit = Transaction.new('deposit', amount, @balance)
    @transaction_history.push(deposit)
    deposit
  end

  def withdraw(amount)
    raise 'Insufficient funds' if amount > @balance
    @balance -= amount
    withdrawal = Transaction.new('withdrawal', amount, @balance)
    @transaction_history.push(withdrawal)
    withdrawal
  end

  def print_statement
    statement = Statement.new(@transaction_history, Kernel)
    statement.print
  end
end
