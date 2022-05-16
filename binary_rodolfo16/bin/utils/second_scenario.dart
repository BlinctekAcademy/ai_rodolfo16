import 'dart:io';
import 'decode.dart' show decode;

void secondScenario(String expression) {
  expression = decode(expression);

  bool sum = false,
      multiplication = false,
      division = false,
      subtraction = false;

  List<String> numbers = [];

  if (expression.contains('+')) {
    numbers = expression.split('+');
    sum = true;
  } else if (expression.contains('-')) {
    numbers = expression.split('-');
    subtraction = true;
  } else if (expression.contains('*')) {
    numbers = expression.split('*');
    multiplication = true;
  } else if (expression.contains('/')) {
    numbers = expression.split('/');
    division = true;
  }

  double result = 0.0;

  List<double> splitToInt = [];
  try {
    for (int i = 0; i < numbers.length; i++) {
      splitToInt.add(double.parse(numbers[i]));
    }
    if (int.tryParse(numbers[0]) is int) {
      if (sum) {
        for (int i = 0; i < splitToInt.length; i++) {
          result = splitToInt[i] + splitToInt[i + 1];
          break;
        }
      } else if (subtraction) {
        for (int i = 0; i < splitToInt.length; i++) {
          result = splitToInt[i] - splitToInt[i + 1];
          break;
        }
      } else if (multiplication) {
        for (int i = 0; i < splitToInt.length; i++) {
          result = splitToInt[i] * splitToInt[i + 1];
          break;
        }
      } else if (division) {
        for (int i = 0; i < splitToInt.length; i++) {
          result = splitToInt[i] / splitToInt[i + 1];
          break;
        }
      }
      stdout
          .write('\nCenário 2: Expressão - $expression / Resultado - $result');
    } else {
      stdout.write('Cenário 2: Não há como realizar operações matemáticas');
    }
  } catch (e) {
    print('\nCenário 2: Não se encaixa nesse cenário');
  }
}
