import 'first_scenario.dart';
import 'second_scenario.dart';

String thirdItem(inputByte) {
  String decimalExpression = '';
  decimalExpression = bytesToChar(inputByte);
  return '$decimalExpression = ${secondItem(inputByte)}';
}
