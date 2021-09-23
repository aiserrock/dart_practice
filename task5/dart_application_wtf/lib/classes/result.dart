class Result {
  final int numberLuckyTickets;
  final double timeExecuting;

  Result({
    this.numberLuckyTickets = 0,
    this.timeExecuting = 0,
  });

  /// Нахождение кол-ва счастливых билетов
  /// [numberLuckyTickets]
  Result findLuckyTicket({
    required int amountFirstThreeNumbers,
  }) {
    const SECONDS_IN_MILLISECONDS = 0.001;
    final time1 = DateTime.now();
    var numberLuckyTickets = 0;
    for (var i = 0; i < 10; i++) {
      for (var j = 0; j < 10; j++) {
        if (amountFirstThreeNumbers - i - j > -1 && amountFirstThreeNumbers - i - j < 10) {
          numberLuckyTickets++;
        }
      }
    }
    numberLuckyTickets *= numberLuckyTickets;
    final time2 = DateTime.now();
    final diffTime =
        time2.difference(time1).inMilliseconds * SECONDS_IN_MILLISECONDS;
    return Result(
        timeExecuting: diffTime, numberLuckyTickets: numberLuckyTickets);
  }
}
