class SimpleOperation {
  var acceptedOperators = ['+', '-', '/', '*', '(', ')'];
  var output = [];
  String mathOperator = '';
  late List<String> stringArray;

  double run(String input) {
    splitCharacters(input);
    scanInput();
    double response = calculate();
    return response;
  }

  // Separa os caracteres que vem juntos
  // 10/5 vira 10 / 5
  void splitCharacters(String input) {
    String newString = input.replaceAll('*', ' * ');
    newString = newString.replaceAll('/', ' / ');
    newString = newString.replaceAll('+', ' + ');
    newString = newString.replaceAll('-', ' - ');

    // Prevent splitting negative numbers
    newString = newString.replaceAll(' *  - ', ' * -');
    newString = newString.replaceAll(' /  - ', ' / -');

    // Separa e joga na lista
    stringArray = newString.split(' ');
  }

  void scanInput() {
    for (int i = 0; i < stringArray.length; i++) {
      double? number = double.tryParse(stringArray[i]);

      // Se for número, joga na lista de número
      // Se for um operador, adiciona no operador
      if (number.runtimeType == double) {
        output.add(number);
      } else if (acceptedOperators.contains(stringArray[i])) {
        mathOperator = stringArray[i];
      }
    }
  }

  double calculate() {
    switch (mathOperator) {
      case "*":
        return output[0] * output[1];
      case "/":
        return output[0] / output[1];
      case "-":
        return output[0] - output[1];
      case "+":
        return output[0] + output[1];
    }
    return 0;
  }
}
