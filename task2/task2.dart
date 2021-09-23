import 'dart:math';
import 'package:equatable/equatable.dart';

void main() {
  final first = Circle(center: kPoint(x: 2, y: 3), radius: 3);
  final second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
  final result = Result().findIntersect(first: first, second: second);
  print('Number intersections = ${result.intersectCount} and execution time = ${result.timeExecuting} seconds');
}
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

class Circle extends Equatable {
  final kPoint center;
  final double radius;

  Circle({
    required this.center,
    required this.radius,
  });

  @override
  List<Object> get props => [center, radius];
}

class kPoint extends Equatable {
  final double x;
  final double y;

  kPoint({
    required this.x,
    required this.y,
  });

  double distanceBetween(kPoint other) {
    return sqrt(pow(x - other.x, 2) + (pow(y - other.y, 2)));
  }

  @override
  List<Object> get props => [x, y];
}