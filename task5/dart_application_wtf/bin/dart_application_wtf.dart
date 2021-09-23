import 'package:dart_application_wtf/classes/result.dart';

void main() {
  final result = Result().findLuckyTicket(amountFirstThreeNumbers: 2);
  print(
      'Number lucky tickets = ${result.numberLuckyTickets} and execution time = ${result.timeExecuting} seconds');
}
