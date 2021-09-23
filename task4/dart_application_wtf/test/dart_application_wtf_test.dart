import 'package:dart_application_wtf/classes/result.dart';
import 'package:test/test.dart';

void main() {
  late var commands;
  var result = Result();
  test('unicCellsCount,v.1', () {
    commands = 'RRSRRLRR';
    expect(result.findUnicCell(commands: commands).countUnicCells, 6);
    expect(result.findUnicCell(commands: commands).timeExecuting, lessThan(1));
  });
  test('unicCellsCount,v.2', () {
    commands = 'RRLLRRLLSSRRLL';
    expect(result.findUnicCell(commands: commands).countUnicCells, 3);
    expect(result.findUnicCell(commands: commands).timeExecuting, lessThan(1));
  });
  test('unicCellsCount,v.3', () {
    commands = 'LLSLLRLL';
    expect(result.findUnicCell(commands: commands).countUnicCells, 6);
    expect(result.findUnicCell(commands: commands).timeExecuting, lessThan(1));
  });
}
