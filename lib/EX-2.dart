class BankAccount {
    // TODO
  final int _accountId;
  final String _accountOwner;
  double _balance = 0;

  BankAccount(this._accountId, this._accountOwner);

  // getter
  double get balance => this._balance;

  void withdraw (double amount) {
    if (amount <= 0) {
      throw Exception("The withdrawal amount must be positive and greater than 0!");
    } else if (amount > _balance) {
      throw Exception("Insufficient balance for withdrawal!");
    } else {
      _balance -= amount;
    }
  } 

  void credit (double amount) {
    if (amount <= 0) {
      throw Exception("The deposit amount must be positive and greater than 0!");
    } else {
      _balance += amount;
    }
  }   
}

class Bank {
    // TODO
  final String _bankName;
  final List<BankAccount> _accounts = [];

  Bank({required String name}) : this._bankName = name;

  BankAccount createAccount (int accountId, String accountOwner) {
    bool exist = _accounts.any((account) => account._accountId == accountId);
    if (exist) {
      throw Exception("Account with ID ${accountId} already exists!");
    } else {
      BankAccount currentAccount = BankAccount(accountId, accountOwner);
      _accounts.add(currentAccount);
      return currentAccount;
    }
  }

}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
