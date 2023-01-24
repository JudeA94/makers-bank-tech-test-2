require 'account'

describe Account do
  context 'on construction' do
    it 'has a balance of 0 and an empty transaction history' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      expect(account.balance).to eq 0
      expect(account.transaction_history).to eq []
    end
    it 'has a sort-code, account number,  and name' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      expect(account.name).to eq('Test Name')
      expect(account.sort_code).to eq('11-22-33')
      expect(account.account_number).to eq('12345678')
    end
  end

  context 'deposit method' do
    it 'increases the balance ' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      account.deposit(100)
      expect(account.balance).to eq 100
    end
    it 'adds a transaction to the history' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      deposit = account.deposit(100)
      expect(account.transaction_history.length).to eq 1
      expect(account.transaction_history[0]).to eq deposit
    end
  end

  context 'withdraw method' do
    it 'throws an error if the balance is too low' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      expect { account.withdraw(50) }.to raise_error 'Insufficient funds'
      expect(account.transaction_history.length).to eq 0
    end
    it 'decreases the balance if enough funds in account' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      account.deposit(100)
      account.withdraw(50)
      expect(account.balance).to eq 50
    end
    it 'adds a transaction to the history if succesful' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      account.deposit(100)
      account.withdraw(50)
      expect(account.transaction_history.length).to eq 2
    end
  end

  context 'print_statement method' do
    it 'creates a new statement and calls it to print' do
      fake_statement = double(:statement, print: 'test statement')
      account = Account.new('Test Name', '11-22-33', '12345678')
      allow(Statement).to receive(:new).and_return(fake_statement)
      expect(account.print_statement).to eq 'test statement'
    end
  end
end