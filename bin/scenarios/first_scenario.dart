List<String> breakInBytes(String inputBar) {
  String tempStr = '';
  List<String> outputList = [];
  for (int i = 0; i < inputBar.length; i++) {
    tempStr += inputBar[i];
    if ((i + 1) % 8 == 0) {
      outputList.add(tempStr);
      tempStr = '';
    }
  }
  return outputList;
}

int potentiation(int inputNum, int exponentNum) {
  int result = 1;
  for (int i = 0; i < exponentNum; i++) {
    result = result * inputNum;
  }
  return result;
}

int binToDecimal(String binaryCode) {
  int decimalValue = 0;
  for (int i = binaryCode.length - 1; i > 0; i--) {
    int exponent = (binaryCode.length - 1) - i;
    if (binaryCode[i] == '1') {
      decimalValue += potentiation(2, exponent);
    }
  }
  return decimalValue;
}

String bytesToChar(byte) {
  List<int> tempList = [];
  String outputStr = '';
  List<String> separatedBars = [];
  separatedBars = breakInBytes(byte);
  for (int i = 0; i < separatedBars.length; i++) {
    int charCode = binToDecimal(separatedBars[i]);
    tempList.add(charCode);
  }
  outputStr = String.fromCharCodes(tempList);
  return outputStr;
}
