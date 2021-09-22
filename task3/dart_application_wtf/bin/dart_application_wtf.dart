import 'package:dart_application_wtf/classes/result.dart';

void main() {
  final result = Result().findMatchesCount(countRectangles: 4);
  print('Number matches = ${result.countMatches} and execution time = ${result.timeExecuting} seconds');
}