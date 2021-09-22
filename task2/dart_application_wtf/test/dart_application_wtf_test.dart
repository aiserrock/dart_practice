import 'package:dart_application_wtf/classes/circle.dart';
import 'package:dart_application_wtf/classes/point.dart';
import 'package:dart_application_wtf/classes/result.dart';
import 'package:test/test.dart';

void main() {
  late var first;
  late var second;
  var result = Result();
  test('intersectCount = 2,v.1', () {
    first = Circle(center: kPoint(x: 2, y: 3), radius: 3);
    second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
    expect(result.findIntersect(first: first,second: second).intersectCount, 2);
    expect(result.findIntersect(first: first,second: second).timeExecuting, lessThan(1));
  });
  test('intersectCount = 2,v.2', () {
    first = Circle(center: kPoint(x: 4, y: 3), radius: 1);
    second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
    expect(result.findIntersect(first: first,second: second).intersectCount, 2);
    expect(result.findIntersect(first: first,second: second).timeExecuting, lessThan(1));
  });
  test('intersectCount = 2,v.3', () {
    first = Circle(center: kPoint(x: 5, y: 3), radius: 2);
    second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
    expect(result.findIntersect(first: first,second: second).intersectCount, 2);
    expect(result.findIntersect(first: first,second: second).timeExecuting, lessThan(1));
  });
  test('intersectCount = 1,v.1', () {
    first = Circle(center: kPoint(x: 1, y: 2), radius: 2);
    second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
    expect(result.findIntersect(first: first,second: second).intersectCount, 1);
    expect(result.findIntersect(first: first,second: second).timeExecuting, lessThan(1));
  });
  test('intersectCount = 1,v.2', () {
    first = Circle(center: kPoint(x: 2, y: 3), radius: 4);
    second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
    expect(result.findIntersect(first: first,second: second).intersectCount, 1);
    expect(result.findIntersect(first: first,second: second).timeExecuting, lessThan(1));
  });
  test('intersectCount = 0,v.1', () {
    first = Circle(center: kPoint(x: 50, y: 3), radius: 3);
    second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
    expect(result.findIntersect(first: first,second: second).intersectCount, 0);
    expect(result.findIntersect(first: first,second: second).timeExecuting, lessThan(1));
  });
  test('intersectCount = -1,v.1', () {
    first = Circle(center: kPoint(x: 2, y: 3), radius: 3);
    second = Circle(center: kPoint(x: 2, y: 3), radius: 3);
    expect(result.findIntersect(first: first,second: second).intersectCount, -1);
    expect(result.findIntersect(first: first,second: second).timeExecuting, lessThan(1));
  });
}
