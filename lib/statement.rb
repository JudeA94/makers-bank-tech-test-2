class Statement
  def initialize(transaction_history, io)
    @io = io
    @transactions = transaction_history
    @header = 'date || credit || debit || balance'
  end

  attr_reader :transactions

  def format_for_printing
    transactions.map do |transaction|
      if transaction.type == 'deposit'
        "#{transaction.date} || #{format('%.2f', transaction.amount)} || || #{format('%.2f', transaction.balance)}"
      else
        "#{transaction.date} || || #{format('%.2f', transaction.amount)} || #{format('%.2f', transaction.balance)}"
      end
    end
  end

  def print
    @io.puts @header
    format_for_printing.each { |statement_line| @io.puts statement_line }
  end
end
