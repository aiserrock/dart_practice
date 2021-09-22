import 'package:dart_application_wtf/classes/result.dart';

void main() {
  final result = Result().findUnicCell(commands: 'RRSRRLRR');
  print(
      'Number unic cells = ${result.countUnicCells} and execution time = ${result.timeExecuting} seconds');
}
