void main() {
  final result = Result().findUnicCell(commands: 'RRSRRLRR');
  print(
      'Number unic cells = ${result.countUnicCells} and execution time = ${result.timeExecuting} seconds');
}

class Result {
  final int countUnicCells;
  final double timeExecuting;

  Result({
    this.countUnicCells = 0,
    this.timeExecuting = 0,
  });

  /// Нахождение уникальных клеток
  /// [countRectangles] которые посетил робот
  Result findUnicCell({
    required String commands,
  }) {
    const SECONDS_IN_MILLISECONDS = 0.001;
    final time1 = DateTime.now();
    late final countUnicCells;
    var unicR = 0;
    var unicL = 0;
    var currentL = 0;
    var currentR = 0;
    final list = commands.split('');
    for (var e in list) {
      switch (e) {
        case 'R':
          currentL--;
          currentR++;
          if (currentR > unicR) {
            unicR = currentR;
          }
          break;
        case 'L':
          currentR--;
          currentL++;
          if (currentL > unicL) {
            unicL = currentL;
          }
          break;
        case 'S':
          break;
      }
    }
    countUnicCells = unicR + unicL + 1;
    final time2 = DateTime.now();
    final diffTime =
        time2.difference(time1).inMilliseconds * SECONDS_IN_MILLISECONDS;
    return Result(timeExecuting: diffTime, countUnicCells: countUnicCells);
  }
}
