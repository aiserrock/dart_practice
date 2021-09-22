import 'dart:math';
import 'package:equatable/equatable.dart';

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
