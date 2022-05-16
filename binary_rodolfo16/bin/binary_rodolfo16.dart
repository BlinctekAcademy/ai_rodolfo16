import 'utils/first_scenario.dart' show firstScenario;
import 'utils/second_scenario.dart' show secondScenario;
import 'utils/third_scenario.dart' show thirdScenario;
import 'utils/fourth_scenario.dart' show fourthScenario;

String binary = '0011001000110000';

void main(List<String> arguments) {
  firstScenario(binary);
  secondScenario(binary);
  thirdScenario(binary);
  fourthScenario(binary);
}
