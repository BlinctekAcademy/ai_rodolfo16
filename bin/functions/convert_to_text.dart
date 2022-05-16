class ConvertToText {
  List<dynamic> binaries = [];

  // Separa o código binário em pacotes de 8
  void splitBinary(String string) {
    RegExp expression = RegExp('([A-Za-z 0-9]{1,8}|[,!.?\s ])');
    var matches = expression.allMatches(string);

    for (var m in matches) {
      binaries.add(m.group(0));
    }
  }

  // Converte para caracteres
  String convertBinaryToString() {
    String res = String.fromCharCodes(binaries.map((value) {
      return int.parse(value, radix: 2);
    }));
    return res;
  }

  // Verifica se começa com um número
  // Transforma para double
  bool isAnExpression(String string) {
    double? firstCharacter = double.tryParse(string[0]);
    if (firstCharacter.runtimeType == double || string[0] == '-') {
      return true;
    }
    return false;
  }

  String run(String string) {
    splitBinary(string);
    String response = convertBinaryToString();
    return response;
  }
}
