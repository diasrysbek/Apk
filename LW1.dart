// TASK 2
bool isLeapYear(int year) {
  if (year % 400 == 0) {
    return true;
  }

  if (year % 100 == 0) {
    return false;
  }

  if (year % 4 == 0) {
    return true;
  }

  return false;
}

String nextDay(int day, int month, int year) {
  int daysInMonth;

  if (month == 2) {
    if (isLeapYear(year)) {
      daysInMonth = 29;
    } else {
      daysInMonth = 28;
    }
  } else if (month == 4 || month == 6 || month == 9 || month == 11) {
    daysInMonth = 30;
  } else {
    daysInMonth = 31;
  }

  // Проверяем неправильную дату
  if (day < 1 || day > daysInMonth || month < 1 || month > 12) {
    return "Invalid date";
  }

  // Если это последний день месяца
  if (day == daysInMonth) {
    day = 1;

    // Если это декабрь
    if (month == 12) {
      month = 1;
      year++;
    } else {
      month++;
    }
  } else {
    day++;
  }

  return "$day.${month.toString().padLeft(2, '0')}.$year";
}

// TASK 3
int countVowels(String text) {
  int count = 0;

  for (int i = 0; i < text.length; i++) {
    String letter = text[i].toLowerCase();

    if (letter == 'a' ||
        letter == 'e' ||
        letter == 'i' ||
        letter == 'o' ||
        letter == 'u') {
      count++;
    }
  }

  return count;
}

// TASK 4
void findMinMax(List<int> numbers) {
  int min = numbers[0];
  int max = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] < min) {
      min = numbers[i];
    }

    if (numbers[i] > max) {
      max = numbers[i];
    }
  }

  print("Min: $min");
  print("Max: $max");
}

// TASK 5
bool isPrime(int number) {
  if (number < 2) {
    return false;
  }

  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

void main() {
  // =========================
  // TASK 1
  // Multiplication table 1-10
  // =========================

  print("TASK 1");

  for (int digit = 1; digit <= 10; digit++) {
    print("Multiplication table for $digit");

    for (int i = 1; i <= 10; i++) {
      print("$digit * $i = ${digit * i}");
    }

    print("");
  }

  // =========================
  // TASK 2
  // Next day
  // =========================

  print("TASK 2");

  print(nextDay(5, 9, 2026)); // 06.09.2026
  print(nextDay(28, 2, 2024)); // 29.02.2024
  print(nextDay(28, 2, 2026)); // 01.03.2026
  print(nextDay(29, 2, 2026)); // Invalid date
  print(nextDay(28, 2, 2100)); // 01.03.2100
  print(nextDay(31, 12, 2025)); // 01.01.2026
  print(nextDay(28, 2, 2000)); // 29.02.2000

  // =========================
  // TASK 3
  // Vowel Counter
  // =========================

  print("TASK 3");

  String text = "flutter mobile development";

  print("Vowels: ${countVowels(text)}");

  // =========================
  // TASK 4
  // Manual min & max
  // =========================

  print("TASK 4");

  List<int> numbers = [14, 88, 3, 42, 99, 12, 67];

  findMinMax(numbers);

  List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67];

  findMinMax(numbers1);

  // =========================
  // TASK 5
  // Prime Number Checker
  // =========================

  print("TASK 5");

  int number1 = 3;
  int number2 = 6;

  if (isPrime(number1)) {
    print("$number1 -> prime number");
  } else {
    print("$number1 -> not prime number");
  }

  if (isPrime(number2)) {
    print("$number2 -> prime number");
  } else {
    print("$number2 -> not prime number");
  }
}
