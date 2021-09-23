import 'package:dart_application_wtf/classes/result.dart';
import 'package:test/test.dart';

void main() {
  late var amountFirstThreeNumbers;
  var result = Result();
  test('luckyTickets,v.1', () {
    amountFirstThreeNumbers = 27;
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).numberLuckyTickets, 1);
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).timeExecuting, lessThan(1));
  });
  test('luckyTickets,v.2', () {
    amountFirstThreeNumbers = 1;
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).numberLuckyTickets, 9);
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).timeExecuting, lessThan(1));
  });
  test('luckyTickets,v.3', () {
    amountFirstThreeNumbers = 2;
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).numberLuckyTickets, 36);
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).timeExecuting, lessThan(1));
  });
  test('luckyTickets,v.4', () {
    amountFirstThreeNumbers = 3;
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).numberLuckyTickets, 100);
    expect(result.findLuckyTicket(amountFirstThreeNumbers: amountFirstThreeNumbers).timeExecuting, lessThan(1));
  });

}
