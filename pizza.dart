import 'dart:io';

void main() {
  String orderAgain = 'yes';

  // Outer while loop: allows continuous ordering
  while (orderAgain == 'yes') {
    print('=' * 59);
    print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large: 10 USD"');

    // While loop: input validation for pizza size
    String size = '';
    while (size != 'small' && size != 'medium' && size != 'large') {
      print('Please enter your pizza size (small, medium, or large):');
      size = (stdin.readLineSync() ?? '').trim().toLowerCase();

      if (size != 'small' && size != 'medium' && size != 'large') {
        print('Invalid size. Please try again.');
      }
    }

    // While loop: input validation for quantity
    int quantity = 0;
    while (quantity <= 0) {
      print('How many pizzas do you want of $size?');
      int? parsed = int.tryParse((stdin.readLineSync() ?? '').trim());

      if (parsed == null || parsed <= 0) {
        print('Invalid quantity. Please enter a whole number greater than 0.');
      } else {
        quantity = parsed;
      }
    }

    // Switch statement: calculate the total payment
    int total = 0;
    switch (size) {
      case 'small':
        total = quantity * 5;
        break;
      case 'medium':
        total = quantity * 7;
        break;
      case 'large':
        total = quantity * 10;
        break;
      default:
        print('Unknown size.');
    }

    print('Your Total Payment is: \$$total');

    // While loop: validate the "order again" answer
    String answer = '';
    while (answer != 'yes' && answer != 'no') {
      print('Do you want to order again? (yes/no):');
      answer = (stdin.readLineSync() ?? '').trim().toLowerCase();

      if (answer != 'yes' && answer != 'no') {
        print('Please type yes or no.');
      }
    }
    orderAgain = answer;
  }

  print('Thank you for your order!');
}
