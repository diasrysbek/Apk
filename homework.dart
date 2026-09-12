void checkBalance({required String name, required double balance}) =>
    print('$name, your balance is $balance');

double deposit({required double currentBalance, double? amount}) {
  amount = amount ?? 0.0;

  double newBalance = currentBalance + amount;

  print('You deposited $amount');
  print('Your new balance is $newBalance');

  return newBalance;
}

double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  int pin = pinCode ?? 0000;

  if (pin != 1234) {
    print('Wrong PIN. Transaction declined.');
    return currentBalance;
  }

  if (amount == null) {
    amount = 0.0;
  }

  if (amount! > currentBalance) {
    print('Not enough money. Transaction declined.');
    return currentBalance;
  }

  double newBalance = currentBalance - amount;

  print('$name withdrew $amount');
  print('Your new balance is $newBalance');

  return newBalance;
}

void main() {
  double balance = 10000;

  checkBalance(name: 'Dias', balance: balance);

  balance = deposit(currentBalance: balance, amount: 5000);

  balance = withdraw(
    name: 'Dias',
    currentBalance: balance,
    amount: 3000,
    pinCode: 1234,
  );

  checkBalance(name: 'Dias', balance: balance);
}
