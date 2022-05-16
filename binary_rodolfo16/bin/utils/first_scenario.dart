import 'dart:io';
import 'decode.dart';

void firstScenario(String expression) {
  expression = decode(expression);

  stdout.write('Cenário 1: Expressão decodificada - $expression');
}
