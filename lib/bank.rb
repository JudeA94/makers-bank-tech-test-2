require_relative 'account'

class Bank
  def initialize(sort_code)
    @sort_code = sort_code
    @used_account_numbers = []
    @accounts = []
  end

  attr_reader :sort_code
  attr_accessor :accounts

  def create_account(name)
    account_number = create_account_number
    account = Account.new(name, @sort_code, account_number)
    @accounts.push(account)
    account
  end

  def remove_account(account_number)
    raise "That account doesn't exist" if @accounts.none? { |account| account.account_number == account_number }
    @accounts.delete_if { |account| account.account_number == account_number }
    @used_account_numbers.delete_if { |existing_number| existing_number == account_number }
  end

  def create_account_number
    account_number = (1..8).to_a.map { rand(10).to_s }.join
    account_number = (1..8).to_a.map { rand(10).to_s }.join while @used_account_numbers.include?(account_number)
    @used_account_numbers.push(account_number)
    account_number
  end
end
