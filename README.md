# Makers bank tech test

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

### Structure and Approach

My initial planning diagram was as follows:
<img width="1682" alt="Screenshot 2023-01-24 at 11 36 33" src="https://user-images.githubusercontent.com/113235574/214281854-50beaa05-f7c4-4c20-96cc-90d4c193cf2f.png">

I approached the problem by first understanding the requirements and acceptance criteria. I then created user stories to break down the requirements into smaller, manageable tasks. I then used test-driven development (TDD) to guide the design of my solution. I wrote tests for the different functionality required, such as deposits, withdrawals and statement printing, and then wrote the code to make the tests pass.

I structured my code using object-oriented design principles. I started with the Bank class as this felt like an appropriate container for the eventual accounts. This has methods for creating and deleting. I then test-drove the account class which allow a user to deposit, withdraw and print a statement. Each deposit and withdrawal is an instance of the transaction class, so this felt the best place to test-drive next. Then, finally, the statement class which formats and prints the transaction history held in the account class.

After feedback some of the features from the original plan were removed and testng for behaviour was improved.

### Testing
The application has 100% test coverage through unit testing. This required mocking for the classes with dependencies, as well testing on the terminal output.

### Installation and Running
To install and run my code, you will need to have Ruby and Rspec installed on your machine. Clone the repository and navigate to the root directory in your terminal. Run bundle install to install the required dependencies. To run the tests, use the command rspec. For an example of how to interact with the application and get an output please see the run file in he projects root directory.

### Dependencies
The code has a dependency on the Rspec gem for testing. I chose to use Rspec because it is a widely used testing framework for Ruby and it has a large community and resources available for support. It is also the testing framework I am most familiar with.

### Extensions
The following extensions could improve the application, although not part of the specification:
Add the capability to store the account information in a database
Add more validation for the input data
Add the ability to view a specific time period of statements.
Add the ability to use different currencies.
