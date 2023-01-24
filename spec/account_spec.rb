require 'account'

describe Account do
  context 'on construction' do
    it 'has a balance of 0 and an empty transaction history' do
      account = Account.new
      expect(account.balance).to eq 0
      expect(account.transaction_history).to eq []
    end
  end

  context 'deposit method' do
    it 'adds the specified amount to the balance' do
      account = Account.new
      initial_balance = account.balance
      account.deposit(100)
      expect(account.balance).to eq initial_balance + 100
    end
    it 'creates a new deposit transaction with the correct amount and final balance' do
      account = Account.new
      initial_balance = account.balance
      deposit = account.deposit(100)
      expect(deposit.type).to eq 'deposit'
      expect(deposit.amount).to eq 100
      expect(deposit.balance).to eq initial_balance + 100
    end
    it 'adds a transaction to the history' do
      account = Account.new
      deposit = account.deposit(100)
      expect(account.transaction_history.length).to eq 1
      expect(account.transaction_history[0]).to eq deposit
    end
  end

  context 'withdraw method' do
    it 'creates a new deposit transaction with the correct amount and final balance' do
      account = Account.new
      account.deposit(100)
      balance = account.balance
      withdrawal = account.withdraw(50)
      expect(withdrawal.type).to eq 'withdrawal'
      expect(withdrawal.amount).to eq 50
      expect(withdrawal.balance).to eq balance - 50
    end
    it 'throws an error if the balance is too low' do
      account = Account.new
      expect { account.withdraw(50) }.to raise_error 'Insufficient funds'
      expect(account.transaction_history.length).to eq 0
    end
    it 'subtracts the specified amount from the balance if enough funds' do
      account = Account.new
      account.deposit(100)
      initial_balance = account.balance
      account.withdraw(50)
      expect(account.balance).to eq initial_balance - 50
    end
    it 'adds a transaction to the history if succesful' do
      account = Account.new
      account.deposit(100)
      account.withdraw(50)
      expect(account.transaction_history.length).to eq 2
    end
  end

  context 'print_statement method' do
    it 'calls the print method on the statement object and create statement object with correct transaction history' do
      account = Account.new
      fake_statement = double(:statement, print: 'test statement')
      expect(Statement).to receive(:new).with(account.transaction_history, Kernel).and_return(fake_statement)
      expect(fake_statement).to receive(:print)
      account.print_statement
    end
  end
end
