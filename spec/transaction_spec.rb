require 'transaction'
require 'date'

describe Transaction do
  context 'on construction' do
    it 'has a type, amount and date and the balance after the transaction' do
      deposit = Transaction.new('deposit', 100, 100)
      current_date = DateTime.now.strftime('%m/%d/%Y')
      expect(deposit.type).to eq 'deposit'
      expect(deposit.amount).to eq 100
      expect(deposit.date).to eq current_date
      expect(deposit.balance).to eq 100
    end
  end
end