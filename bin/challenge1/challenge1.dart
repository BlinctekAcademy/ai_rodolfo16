import '../functions/convert_to_text.dart';

class Challenge1 {
  String run(String string) {
    String response = ConvertToText().run(string);
    print('=========================');
    print('    ');
    print('Cenário 1');
    print('String convertida: $response');
    print('    ');
    print('=========================');
    return response;
  }
}
