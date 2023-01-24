require 'account'
require 'statement'
require 'bank'

describe 'feature test' do
  context 'creating an account, making transactions and printing a statement' do
    it 'prints the statement with all required details and in the required output' do
      bank = Bank.new
      account = bank.create_account
      expect(bank.accounts).to eq [account]
      deposit = account.deposit(100)
      withdrawal = account.withdraw(50)
      expect(account.transaction_history).to eq [deposit, withdrawal]
      expected_output = "date || credit || debit || balance\n#{deposit.date} || 100.00 || || 100.00\n#{withdrawal.date} || || 50.00 || 50.00\n"
      account.print_statement
      expect { account.print_statement }.to output(expected_output).to_stdout
    end
  end
end