require_relative 'lib/bank'

bank = Bank.new
account = bank.create_account
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)
account.print_statement
