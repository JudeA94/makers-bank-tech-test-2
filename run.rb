require_relative 'lib/bank'

bank = Bank.new('11-22-33')
account = bank.create_account('Sam Samson')
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)
account.print_statement
