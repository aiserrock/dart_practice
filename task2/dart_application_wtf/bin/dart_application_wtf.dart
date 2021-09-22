import 'package:dart_application_wtf/classes/circle.dart';
import 'package:dart_application_wtf/classes/point.dart';
import 'package:dart_application_wtf/classes/result.dart';

void main() {
  final first = Circle(center: kPoint(x: 2, y: 3), radius: 3);
  final second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
  final result = Result().findIntersect(first: first, second: second);
  print('Number intersections = ${result.intersectCount} and execution time = ${result.timeExecuting} seconds');
}