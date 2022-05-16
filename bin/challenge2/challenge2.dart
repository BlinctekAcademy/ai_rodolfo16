import '../functions/convert_to_text.dart';
import '../functions/simple_operation.dart';

class Challenge2 {
  void run(String string) {
    ConvertToText convert = ConvertToText();
    String decodedString = convert.run(string);

    if (convert.isAnExpression(decodedString) == false) {
      print('=========================');
      print('    ');
      print('Cenário 2');
      print('Não é uma expressão matemática');
      print('    ');
      print('=========================');
    }

    double response = SimpleOperation().run(decodedString);

    print('=========================');
    print('    ');
    print('Cenário 2');
    print('Expressão:');
    print('$decodedString = $response');
    print('    ');
    print('=========================');
  }
}
