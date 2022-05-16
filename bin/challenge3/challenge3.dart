import '../functions/convert_to_text.dart';
import '../functions/shunting_yard.dart';
import '../functions/rpn.dart';

class Challenge3 {
  void run(String string) {
    ConvertToText convert = ConvertToText();
    String decodedString = convert.run(string);

    if (convert.isAnExpression(decodedString) == false) {
      print('=========================');
      print('    ');
      print('Cenário 3');
      print('Não é uma expressão matemática');
      print('    ');
      print('=========================');
      return;
    }

    List<dynamic> postFix = ShuntingYard(string: decodedString).evaluate();
    double result = Rpn().solve(postFix);

    print('=========================');
    print('    ');
    print('Cenário 3');
    print('Expressão:');
    print('$decodedString = $result');
    print('    ');
    print('=========================');
  }
}
