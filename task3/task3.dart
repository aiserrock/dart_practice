import 'dart:math';

void main() {
  final result = Result().findMatchesCount(countRectangles: 4);
  print('Number matches = ${result.countMatches} and execution time = ${result.timeExecuting} seconds');
}

class Result {
  final int countMatches;
  final double timeExecuting;

  Result({
    this.countMatches = 0,
    this.timeExecuting = 0,
  });

  /// Нахождение кол-во спичек нужное для построения
  /// [countRectangles] квадратов
  Result findMatchesCount({
    required int countRectangles,
  }) {
    const SECONDS_IN_MILLISECONDS = 0.001;
    final int length, width, countMatches;
    final time1 = DateTime.now();
    length = (sqrt(countRectangles)).floor();
    width = (countRectangles / length).ceil();
    countMatches = 2 * countRectangles + length + width;
    final time2 = DateTime.now();
    final diffTime =
        time2.difference(time1).inMilliseconds * SECONDS_IN_MILLISECONDS;
    return Result(timeExecuting: diffTime, countMatches: countMatches);
  }
}
