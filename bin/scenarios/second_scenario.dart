import 'first_scenario.dart';
import 'forth_scenario.dart';
import 'third_scenario.dart';

void appendNegativeNums(List<String> inputList) {
  var operators = ['+', '-', '*', '/', '('];
  if (inputList[0] == '-' && int.tryParse(inputList[1]) != null) {
    inputList.replaceRange(0, 2, ['-${inputList[1]}']);
  }
  for (int i = 0; i < inputList.length; i++) {
    if (operators.contains(inputList[i]) && inputList[i + 1] == '-') {
      inputList.replaceRange(i + 1, i + 3, ['-${inputList[i + 2]}']);
    }
  }
}

List<String> breakExpression(String decimalExpression) {
  List<String> brokenExpression = [];
  String tempString = '';

  for (int i = 0; i < decimalExpression.length; i++) {
    if (int.tryParse(decimalExpression[i]) != null) {
      tempString += decimalExpression[i];
      if (i == decimalExpression.length - 1) {
        brokenExpression.add(tempString);
      }
    } else {
      if (tempString != '') {
        brokenExpression.add(tempString);
      }
      tempString = decimalExpression[i];
      brokenExpression.add(tempString);
      tempString = '';
    }
  }
  appendNegativeNums(brokenExpression);
  return brokenExpression;
}

//RPN: Reverse Polish Notation
List<String> infixToRPN(List<String> decimalExpression) {
  List<String> rpnExpression = [];
  List<String> operatorStack = [];
  String actualChar = '';
  int charPriority;

  var priorityOrder = {
    '(': 4,
    ')': 0,
    '^': 3,
    '*': 2,
    '/': 2,
    '+': 1,
    '-': 1,
  };

  for (int i = 0; i < decimalExpression.length; i++) {
    actualChar = decimalExpression[i];
    charPriority =
        int.tryParse(actualChar) == null ? priorityOrder[actualChar]! : -1;

    if (int.tryParse(actualChar) != null) {
      //actualChar is a num
      rpnExpression.add(actualChar);
    } else if (operatorStack.isEmpty) {
      //actualChar is an operator
      operatorStack.add(actualChar);
    } else {
      //actualChar is an operator
      String lastOperator = operatorStack[operatorStack.length - 1];
      int lastOperatorPriority = priorityOrder[lastOperator]!;
      if (charPriority > lastOperatorPriority) {
        operatorStack.add(actualChar);
        lastOperator = operatorStack[operatorStack.length - 1];
        lastOperatorPriority = priorityOrder[lastOperator]!;
      } else {
        //Cleans Stack
        while (charPriority <= lastOperatorPriority &&
            lastOperator != '(' &&
            operatorStack.length > 1) {
          if (charPriority <= lastOperatorPriority) {
            rpnExpression.add(lastOperator);
            operatorStack.removeAt(operatorStack.length - 1);
            lastOperator = operatorStack[operatorStack.length - 1];
            lastOperatorPriority = priorityOrder[lastOperator]!;
          }
        }

        //clean last stack operator (until this moment)
        if (operatorStack.isNotEmpty) {
          if (charPriority <= lastOperatorPriority) {
            rpnExpression.add(operatorStack[operatorStack.length - 1]);
            operatorStack.removeAt(operatorStack.length - 1);
            if (operatorStack.isNotEmpty) {
              lastOperator = operatorStack[operatorStack.length - 1];
              lastOperatorPriority = priorityOrder[lastOperator]!;
            }
          }
        }

        //Add actual operator
        operatorStack.add(actualChar);
        lastOperator = operatorStack[operatorStack.length - 1];
        lastOperatorPriority = priorityOrder[lastOperator]!;

        //Parentesis handler
        if (decimalExpression[i] == ')') {
          operatorStack.removeAt(operatorStack.length - 1);
          rpnExpression.remove('(');
          if (operatorStack.isNotEmpty) {
            lastOperator = operatorStack[operatorStack.length - 1];
            lastOperatorPriority = priorityOrder[lastOperator]!;
          }
        }
      }
    }
  }

  //Add final operators to expression
  if (operatorStack != []) {
    for (int j = operatorStack.length - 1; j > -1; j--) {
      rpnExpression.add(operatorStack[j]);
      operatorStack.removeAt(j);
    }
  }
  return rpnExpression;
}

int rpnSolver(List<String> rpnInput) {
  List<String> calculatingStack = [];
  int result = 0;
  int lastvalue;
  int penultValue;
  int penultIndex;

  for (int i = 0; i < rpnInput.length; i++) {
    if (int.tryParse(rpnInput[i]) != null) {
      calculatingStack.add(rpnInput[i]);
    } else {
      penultValue = int.parse(calculatingStack[calculatingStack.length - 2]);
      lastvalue = int.parse(calculatingStack[calculatingStack.length - 1]);
      penultIndex = calculatingStack.length - 2;

      if (rpnInput[i] == '+') {
        result = penultValue + lastvalue;
        calculatingStack.removeRange(penultIndex, calculatingStack.length);
        calculatingStack.add(result.toString());
      } else if (rpnInput[i] == '-' && rpnInput[i].length == 1) {
        result = penultValue - lastvalue;
        calculatingStack.removeRange(penultIndex, calculatingStack.length);
        calculatingStack.add(result.toString());
      } else if (rpnInput[i] == '*') {
        result = penultValue * lastvalue;
        calculatingStack.removeRange(penultIndex, calculatingStack.length);
        calculatingStack.add(result.toString());
      } else if (rpnInput[i] == '/') {
        result = (penultValue / lastvalue).round();
        calculatingStack.removeRange(penultIndex, calculatingStack.length);
        calculatingStack.add(result.toString());
      }
    }
  }
  return int.parse(calculatingStack[0]);
}

int secondItem(inputByte) {
  String decimalExpression = '';
  List<String> brokenDecimalExpression = [];
  List<String> rpnExpression = [];

  decimalExpression = bytesToChar(inputByte);
  brokenDecimalExpression = breakExpression(decimalExpression);
  rpnExpression = infixToRPN(brokenDecimalExpression);
  return rpnSolver(rpnExpression);
}

String? checkFirstChar(String inputString, int actualItem) {
  String firstChar = '';
  String convertedChar = '';
  for (int i = 0; i < 8; i++) {
    firstChar += inputString[i];
  }

  convertedChar = bytesToChar(firstChar);

  if (int.tryParse(convertedChar) != null ||
      convertedChar == '(' ||
      convertedChar == '-') {
    if (actualItem == 2) {
      return secondItem(inputString).toString();
    } else if (actualItem == 3) {
      return thirdItem(inputString).toString();
    } else if (actualItem == 4) {
      return forthItem(inputString).toString();
    }
  }
  return bytesToChar(inputString);
}
