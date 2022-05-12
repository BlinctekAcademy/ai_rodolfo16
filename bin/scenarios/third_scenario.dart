import 'first_scenario.dart';
import 'second_scenario.dart';

String thirdItem(inputByte) {
  String decimalExpression = '';
  List<String> brokenDecimalExpression = [];
  List<String> rpnExpression = [];

  decimalExpression = bytesToChar(inputByte);
  brokenDecimalExpression = breakExpression(decimalExpression);
  rpnExpression = infixToRPN(brokenDecimalExpression);
  return '$decimalExpression = ${rpnSolver(rpnExpression)}';
}
