String decode(String expression) {
  expression = expression
      .replaceAllMapped(RegExp(r".{8}"), (match) => "${match.group(0)} ")
      .trimRight();
  List<String> expressionArraySplit = expression.split(' ');
  expression = String.fromCharCodes(
      expressionArraySplit.map((v) => int.parse(v, radix: 2)));

  return expression;
}
