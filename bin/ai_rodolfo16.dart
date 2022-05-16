import 'challenge1/challenge1.dart';
import 'challenge2/challenge2.dart';
import 'challenge4/challenge4.dart';
import 'functions/shunting_yard.dart';
import 'challenge3/challenge3.dart';

void main(List<String> arguments) {
  /*
  String str = 'Hello!';
  String bin = '010010000110010101101100011011000110111100100001';
  String mathCalc = '00110001001100000010101000110010';
  */
  String simpleCalc = '00110001001100000010101000110010';
  String simpleNegative = '0010110100110101001010100011000100110000';
  String mathCalc = '00110001001100000010101000110010';
  String complexMathCalc =
      '0011000100110000001010100011001000101011001101100010101100111000001011110010110100110100';

  //Challenge1().run(mathCalc);
  //Challenge2().run(simpleNegative);
  //Challenge3().run(complexMathCalc);
  Challenge4().run(complexMathCalc);
}
