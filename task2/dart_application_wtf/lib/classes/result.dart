import 'circle.dart';

class Result {
  final double timeExecuting;
  final int intersectCount;

  Result({
    this.timeExecuting = 0,
    this.intersectCount = 0,
  });

  /// Нахождение кол-во пересечений двух окружностей
  /// [first] и [second]
  Result findIntersect({
    required Circle first,
    required Circle second,
  }) {
    const SECONDS_IN_MILLISECONDS = 0.001;
    final time1 = DateTime.now();
    final int count;

    /// Если круги полностью идентичны => бесконечно много пересечений
    if (first == second) {
      count = -1;
    } else {
      /// а) Если один круг находится в нутри другого и имеет одну точку касания
      /// б) Если круги находятся рядом друг с ругом и имеют одну точку касания
      if (_distanceBetweenCenters(first: first, second: second) ==
              first.radius + second.radius ||
          _distanceBetweenCenters(first: first, second: second) +
                  first.radius ==
              second.radius ||
          _distanceBetweenCenters(first: first, second: second) +
                  second.radius ==
              first.radius) {
        count = 1;
      } else {
        /// а) Круги находятся друг от друга на расстоянии
        /// б) Один круг вписан в другой и не имеет точек пересечения
        if (_distanceBetweenCenters(first: first, second: second) >
                first.radius + second.radius ||
            _distanceBetweenCenters(first: first, second: second) +
                    first.radius <
                second.radius ||
            _distanceBetweenCenters(first: first, second: second) +
                    second.radius <
                first.radius) {
          count = 0;
        } else {
          /// Во всех оставшихся случаях всегда 2 пересечения
          count = 2;
        }
      }
    }
    final time2 = DateTime.now();
    final diffTime =
        time2.difference(time1).inMilliseconds * SECONDS_IN_MILLISECONDS;
    return Result(timeExecuting: diffTime, intersectCount: count);
  }

  /// Нахождение расстояния между центрами окружностей
  /// [first] и [second]
  double _distanceBetweenCenters(
          {required Circle first, required Circle second}) =>
      first.center.distanceBetween(second.center);
}
