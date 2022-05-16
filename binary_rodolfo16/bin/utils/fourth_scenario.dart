import 'decode.dart';

void fourthScenario(String expression) {
  expression = decode(expression);
  String initialExpression = expression;

  RegExp multiplyAndDivisionRegex = RegExp(r"[\d.]+[/\*][\d.]+");
  RegExp sumAndSubRegex = RegExp(r"[\d.]+[-\+][\d.]+");
  RegExp numRegex = RegExp(r"[\d.]+");

  while (RegExp(r"[\*/]").hasMatch(expression)) {
    var m = multiplyAndDivisionRegex.firstMatch(expression);
    if (m == null) continue;
    String? match = m.group(0);
    if (match == null) continue;
    Iterable<RegExpMatch> numbers = numRegex.allMatches(match);
    String? firstNumber = numbers.first.group(0);
    if (firstNumber == null) continue;
    String? lastNumber = numbers.last.group(0);
    if (lastNumber == null) continue;

    String? symbol = RegExp(r'[\*/]').firstMatch(match)?.group(0);
    double result = 0;
    if (symbol == "*") {
      result = double.parse(firstNumber) * double.parse(lastNumber);
    } else if (symbol == "/") {
      result = double.parse(firstNumber) / double.parse(lastNumber);
    }
    expression = expression.replaceAll(match, result.toString());
  }

  while (RegExp(r"[\+-]").hasMatch(expression)) {
    var m = sumAndSubRegex.firstMatch(expression);
    if (m == null) continue;
    String? match = m.group(0);
    if (match == null) continue;
    Iterable<RegExpMatch> numbers = numRegex.allMatches(match);
    String? firstNumber = numbers.first.group(0);
    if (firstNumber == null) continue;
    String? lastNumber = numbers.last.group(0);
    if (lastNumber == null) continue;

    String? symbol = RegExp(r'[\+-]').firstMatch(match)?.group(0);
    double result = 0;
    if (symbol == "+") {
      result = double.parse(firstNumber) + double.parse(lastNumber);
    } else if (symbol == "-") {
      result = double.parse(firstNumber) - double.parse(lastNumber);
    }
    expression = expression.replaceAll(match, result.toString());
  }
  double result = double.parse(expression);
  int resultInt = result.toInt();
  String resultString = resultInt.toString();
  String stringToBinary = resultString.codeUnits
      .map((x) => x.toRadixString(2).padLeft(8, '0'))
      .join();
  print(
      'Cenário 4: Expressão decodificada - $initialExpression / Resultado - $expression (Binário - $stringToBinary)');
}
