import 'package:dart_application_wtf/classes/circle.dart';
import 'package:dart_application_wtf/classes/point.dart';

void main() {
  final first = Circle(center: kPoint(x: 2, y: 3), radius: 3);
  final second = Circle(center: kPoint(x: 1, y: 3), radius: 3);
  print(
      'Number intersections = ${_findIntersect(first: first, second: second)}');
}

/// Нахождение кол-во пересечений двух окружностей
/// [first] и [second]
int _findIntersect({
  required Circle first,
  required Circle second,
}) {
  /// Если круги полностью идентичны => бесконечно много пересечений
  if (first == second) {
    return -1;
  } else {
    /// а) Если один круг находится в нутри другого и имеет одну точку касания
    /// б) Если круги находятся рядом друг с ругом и имеют одну точку касания
    if (_distanceBetweenCenters(first: first, second: second) ==
            first.radius + second.radius ||
        _distanceBetweenCenters(first: first, second: second) + first.radius ==
            second.radius ||
        _distanceBetweenCenters(first: first, second: second) + second.radius ==
            first.radius) {
      return 1;
    } else {
      /// а) Круги находятся друг от друга на расстоянии
      /// б) Один круг вписан в другой и не имеет точек пересечения
      if (_distanceBetweenCenters(first: first, second: second) >
              first.radius + second.radius ||
          _distanceBetweenCenters(first: first, second: second) + first.radius <
              second.radius ||
          _distanceBetweenCenters(first: first, second: second) +
                  second.radius <
              first.radius) {
        return 0;
      } else {
        /// Во всех оставшихся случаях всегда 2 пересечения
        return 2;
      }
    }
  }
}

/// Нахождение расстояния между центрами окружностей
/// [first] и [second]
double _distanceBetweenCenters(
        {required Circle first, required Circle second}) =>
    first.center.distanceBetween(second.center);
