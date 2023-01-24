require 'statement'

describe Statement do
  context 'on construction' do
    it 'contains the transactional history of the account' do
      fake_deposit = double(:transaction, date: '23/01/2023', type: 'deposit', amount: 100)
      fake_withdrawal = double(:transaction, date: '23/01/2023', type: 'withdrawal', amount: 50)
      io = double :io
      statement = Statement.new([fake_deposit, fake_withdrawal], io)
      expect(statement.transactions).to eq [fake_deposit, fake_withdrawal]
    end
  end
  context 'format_for_printing method' do
    it 'returns the transaction history in the desired format' do
      fake_deposit = double(:transaction, date: '23/01/2023', type: 'deposit', amount: 100, balance: 100)
      fake_withdrawal = double(:transaction, date: '23/01/2023', type: 'withdrawal', amount: 50, balance: 50)
      io = double :io
      statement = Statement.new([fake_deposit, fake_withdrawal], io)
      expect(statement.format_for_printing).to eq ['23/01/2023 || 100.00 || || 100.00', '23/01/2023 || || 50.00 || 50.00']
    end
  end
  context 'print method' do
    it 'raises error if no transactions' do
      io = double :io
      statement = Statement.new([], io)
      expect { statement.print }.to raise_error 'No account transactions'
    end
    it 'calls the format_for_printing method' do
      io = double :io
      fake_deposit = double(:transaction, date: '23/01/2023', type: 'deposit', amount: 100, balance: 100)
      fake_withdrawal = double(:transaction, date: '23/01/2023', type: 'withdrawal', amount: 50, balance: 50)
      statement = Statement.new([fake_deposit, fake_withdrawal], io)
      expect(io).to receive(:puts).with('date || credit || debit || balance')
      expect(statement).to receive(:format_for_printing).and_return([])
      statement.print
    end
    it 'returns the transaction history in the desired format' do
      fake_deposit = double(:transaction, date: '23/01/2023', type: 'deposit', amount: 100, balance: 100)
      fake_withdrawal = double(:transaction, date: '23/01/2023', type: 'withdrawal', amount: 50, balance: 50)
      io = double :io
      expect(io).to receive(:puts).with('date || credit || debit || balance')
      expect(io).to receive(:puts).with('23/01/2023 || 100.00 || || 100.00')
      expect(io).to receive(:puts).with('23/01/2023 || || 50.00 || 50.00')
      statement = Statement.new([fake_deposit, fake_withdrawal], io)
      statement.print
    end
  end
end
