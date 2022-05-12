import 'second_scenario.dart';

List<int> getCharCodes(int num) {
  String inputNum = num.toString();
  List<int> outputList = inputNum.codeUnits;
  return outputList;
}

String numToByte(int num) {
  String outputString = '';
  int quotient = num;
  for (int i = 0; i < 8; i++) {
    outputString += (quotient % 2).toString();
    quotient = quotient ~/ 2;
  }
  outputString = outputString.split('').reversed.join('');
  return outputString;
}

String joinBytes(List<String> inputList) {
  String outputString = inputList[0];
  for (int i = 0; i < inputList.length - 1; i++) {
    outputString += inputList[i + 1];
  }
  return outputString;
}

String forthItem(String inputString) {
  int result = secondItem(inputString);
  List<int> charCodes = getCharCodes(result);
  List<String> bytes = [];
  String resultBar = '';
  for (int i = 0; i < charCodes.length; i++) {
    bytes.add(numToByte(charCodes[i]));
  }
  resultBar = joinBytes(bytes);
  return resultBar;
}
