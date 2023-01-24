require 'bank'

describe Bank do
  context 'On construction' do
    it 'stores a valid sort code' do
      bank = Bank.new('11-22-33')
      expect(bank.sort_code).to eq '11-22-33'
    end
    it 'initializes with an empty array of accounts' do
      bank = Bank.new('11-22-33')
      expect(bank.accounts).to eq []
    end
  end

  context 'create_account method' do
    it 'adds an account to the accounts list' do
      bank = Bank.new('11-22-33')
      account = bank.create_account('Test Name')
      expect(bank.accounts.length).to eq 1
      expect(bank.accounts[0]).to eq account
    end
  end

  context 'delete_account method' do
    it 'removes an account to the accounts list' do
      bank = Bank.new('11-22-33')
      bank.create_account('Test Name')
      expect(bank.accounts.length).to eq 1
      acc_number = bank.accounts[0].account_number
      bank.remove_account(acc_number)
      expect(bank.accounts.length).to eq 0
    end

    it "throws an error if the account doesn't exist" do
      bank = Bank.new('11-22-33')
      bank.create_account('Test Name')
      expect(bank.accounts.length).to eq 1
      acc_number = bank.accounts[0].account_number.to_i
      wrong_account_num = (acc_number + 1).to_s
      expect { bank.remove_account(wrong_account_num) }.to raise_error "That account doesn't exist"
      expect(bank.accounts.length).to eq 1
    end
  end

  context 'create_account_number method' do
    it 'generates a random eight digit number' do
      bank = Bank.new('11-22-33')
      expect(bank.create_account_number.length).to eq 8
    end
  end
end
