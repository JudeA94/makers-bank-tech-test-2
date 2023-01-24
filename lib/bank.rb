require_relative 'account'

class Bank
  def initialize
    @accounts = []
  end

  attr_accessor :accounts

  def create_account
    account = Account.new
    @accounts.push(account)
    account
  end

  def remove_account(account)
    raise "That account doesn't exist" unless @accounts.include?(account)
    @accounts.delete(account)
  end
end
