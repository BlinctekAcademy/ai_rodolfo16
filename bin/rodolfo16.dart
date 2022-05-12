import 'scenarios/first_scenario.dart';
import 'scenarios/second_scenario.dart';

var inputString = '00110001001101010010101100110001001100000010111100110010';

void main() {
  print('====' * 20);
  print('Primeiro desafio: ${bytesToChar(inputString)}');
  print('Segundo desafio: ${checkFirstChar(inputString, 2)}');
  print('Terceiro desafio: ${checkFirstChar(inputString, 3)}');
  print('Quarto desafio: ${checkFirstChar(inputString, 4)}');
  print('====' * 20);
}
