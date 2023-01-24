require 'bank'

describe Bank do
  context 'On construction' do
    it 'initializes with an empty array of accounts' do
      bank = Bank.new
      expect(bank.accounts).to eq []
    end
  end

  context 'create_account method' do
    it 'adds an account to the accounts list' do
      bank = Bank.new
      account = bank.create_account
      expect(bank.accounts.length).to eq 1
      expect(bank.accounts[0]).to eq account
    end
  end

  context 'delete_account method' do
    it 'removes an account to the accounts list' do
      bank = Bank.new
      account = bank.create_account
      expect(bank.accounts.length).to eq 1
      bank.remove_account(account)
      expect(bank.accounts.length).to eq 0
    end

    it "throws an error if the account doesn't exist" do
      bank = Bank.new
      bank.create_account
      expect(bank.accounts.length).to eq 1
      expect { bank.remove_account('') }.to raise_error "That account doesn't exist"
      expect(bank.accounts.length).to eq 1
    end
  end
end
