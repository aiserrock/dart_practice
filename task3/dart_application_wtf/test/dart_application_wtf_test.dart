import 'package:dart_application_wtf/classes/result.dart';
import 'package:test/test.dart';

void main() {
  late var countMatches;
  var result = Result();
  test('matchesCount,v.1', () {
    countMatches = 1;
    expect(result.findMatchesCount(countRectangles: countMatches).countMatches, 4);
    expect(result.findMatchesCount(countRectangles: countMatches).timeExecuting, lessThan(1));
  });
  test('matchesCount,v.2', () {
    countMatches = 2;
    expect(result.findMatchesCount(countRectangles: countMatches).countMatches, 7);
    expect(result.findMatchesCount(countRectangles: countMatches).timeExecuting, lessThan(1));
  });
  test('matchesCount,v.3', () {
    countMatches = 4;
    expect(result.findMatchesCount(countRectangles: countMatches).countMatches, 12);
    expect(result.findMatchesCount(countRectangles: countMatches).timeExecuting, lessThan(1));
  });
}
