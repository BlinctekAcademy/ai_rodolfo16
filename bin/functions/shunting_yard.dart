class ShuntingYard {
  var acceptedOperators = ['+', '-', '/', '*', '(', ')'];
  List output = [];
  List<String> mathOperator = [];
  String string;
  late List<String> stringArray;

  ShuntingYard({required this.string});

  List<dynamic> evaluate() {
    splitCharacters();
    scanInput();
    return output;
  }

  // Separa os caracteres que vem juntos
  // 10/5 vira 10 / 5
  void splitCharacters() {
    String newString = string.replaceAll('*', ' * ');
    newString = newString.replaceAll('/', ' / ');
    newString = newString.replaceAll('+', ' + ');
    newString = newString.replaceAll('-', ' - ');

    // Prevent splitting negative numbers
    newString = newString.replaceAll(' *  - ', ' * -');
    newString = newString.replaceAll(' /  - ', ' / -');

    // Separa e joga na lista
    stringArray = newString.split(' ');
  }

  double calculatePrecedence(String operat) {
    switch (operat) {
      case "*":
        return 4;
      case "/":
        return 4;
      case "-":
        return 3;
      case "+":
        return 3;
    }
    return 0;
  }

  void scanInput() {
    for (int i = 0; i < stringArray.length; i++) {
      // Tentamos fazer o parse. Se não der, é algum caractere especial
      double? number = double.tryParse(stringArray[i]);

      // Se for número, joga na lista de número
      // Se for um operador, adiciona no operador
      if (number.runtimeType == double) {
        output.add(number);
      } else if (acceptedOperators.contains(stringArray[i])) {
        // Se a lista de operadores estiver vazia
        // apenas adicionar na lista de operadores
        if (mathOperator.isEmpty) {
          mathOperator.add(stringArray[i]);
        } else {
          if (calculatePrecedence(stringArray[i]) >
              calculatePrecedence(mathOperator.last)) {
            // Se a prioridade deste operador for maior que o último da lista de operadores
            // adicionar ele na lista de operadores
            mathOperator.add(stringArray[i]);
          } else if (calculatePrecedence(stringArray[i]) <=
              calculatePrecedence(mathOperator.last)) {
            // Se a prioridade for menor que o último da lista de operadores
            // adicionamos os operadores na lista de OUTPUT - junto com os números
            popUntilLower(stringArray[i]);
            mathOperator.add(stringArray[i]);
          }
        }
      }
    }
    // Finalmente, adicionamos os restantes dos operadores na lista de numeros
    // em ordem crescente de prioridade
    addOperatorsToOutput();
  }

  void popUntilLower(String item) {
    while (mathOperator.isNotEmpty &&
        calculatePrecedence(item) <= calculatePrecedence(mathOperator.last)) {
      output.add(mathOperator.last);
      mathOperator.removeLast();
    }
  }

  void addOperatorsToOutput() {
    // Sorteando de acordo com a ordem de prioridade
    mathOperator.sort((String a, String b) =>
        calculatePrecedence(b).compareTo(calculatePrecedence(a)));

    // Adicionando na lista de números
    for (String operat in mathOperator) {
      output.add(operat);
    }

    mathOperator.clear();
  }

  void convertToReadable() {
    print("output: $output");
    print("operators: $mathOperator");
  }
}


    /* 
    -Split the expression string into recognizable numbers [1, '*', -5]

    -Scan input string from left to right character by character.

    -If the character is an operand, put it into output stack.

    -If the character is an operator and operator's stack is empty, push operator into operators' stack.

    -If the operator's stack is not empty, there may be following possibilities.

    -If the precedence of scanned operator is greater than the top most operator of operator's stack, push this 
    operator into operand's stack.
    
    -If the precedence of scanned operator is less than or equal to the top most operator of operator's stack, 
    pop the operators from operand's stack until we find a low precedence operator than the scanned character.
     Never pop out ( '(' ) or ( ')' ) whatever may be the precedence level of scanned character.
    
    -If the character is opening round bracket ( '(' ), push it into operator's stack.
    
    -If the character is closing round bracket ( ')' ), pop out operators from operator's stack until we find an
    opening bracket ('(' ).
    
    -Now pop out all the remaining operators from the operator's stack and push into output stack into order: high precedence first.

    */