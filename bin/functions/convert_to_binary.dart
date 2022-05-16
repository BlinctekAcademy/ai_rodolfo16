class ConvertToBinary {
  String run(String string) {
    String result =
        string.codeUnits.map((x) => x.toRadixString(2).padLeft(8, '0')).join();

    return result;
  }
}
